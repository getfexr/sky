import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart' as basic_utils;

import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';
import 'package:sky/modules/hive/hive.dart';
import 'package:sky/modules/hive/hive_boxes.dart';
import 'package:sky/modules/utils.dart';
import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:sky/config.dart';

final String _secret = Config().jwtAuthSecret;
final String _issuer = 'Fexr Sky';
final String _portMapIndex = 'peer_id_index';

enum _RubixTokenType {
  challengeToken,
  accessToken,
}

String _getClaimType(JwtClaim claim) {
  return claim.toJson()['type'];
}

class AccountInfoResponse {
  bool status;
  String message;
  dynamic result;
  List<AccountInfo> accountInfo;

  AccountInfoResponse({
    required this.status,
    required this.message,
    required this.result,
    required this.accountInfo,
  });

  factory AccountInfoResponse.fromJson(Map<String, dynamic> json) {
    return AccountInfoResponse(
      status: json['status'],
      message: json['message'],
      result: json['result'],
      accountInfo: (json['account_info'] as List<dynamic>)
          .map((item) => AccountInfo.fromJson(item))
          .toList(),
    );
  }
}

class AccountInfo {
  String did;
  int didType;
  int wholeRbt;
  int pledgedWholeRbt;
  int lockedWholeRbt;
  int partRbt;
  int pledgedPartRbt;
  int lockedPartRbt;

  AccountInfo({
    required this.did,
    required this.didType,
    required this.wholeRbt,
    required this.pledgedWholeRbt,
    required this.lockedWholeRbt,
    required this.partRbt,
    required this.pledgedPartRbt,
    required this.lockedPartRbt,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      did: json['did'],
      didType: json['did_type'],
      wholeRbt: json['whole_rbt'],
      pledgedWholeRbt: json['pledged_whole_rbt'],
      lockedWholeRbt: json['locked_whole_rbt'],
      partRbt: json['part_rbt'],
      pledgedPartRbt: json['pledged_part_rbt'],
      lockedPartRbt: json['locked_part_rbt'],
    );
  }
}

class Token {
  final String token;
  final DateTime expiry;

  Token(this.token, this.expiry);
}

class RubixNodeBalancer {
  RubixNodeBalancer._internal();
  static final RubixNodeBalancer _instance = RubixNodeBalancer._internal();
  factory RubixNodeBalancer() {
    return _instance;
  }

  int _currentPortIndex = 0;
  Future<void> setCurrentPortIndex() async {
    _currentPortIndex = await loadPortIndex();
    print('Port index: $_currentPortIndex');
  }

  final BiMap<String, int> rubixPeerIdPortMap =
      BiMap.fromMap(Config().rubixPeerIdPortMap);
  // Circularly iterate through the ports
  String getNextPeerId() {
    var peerIds = rubixPeerIdPortMap.keys.toList();
    var peerId = peerIds[_currentPortIndex];
    _currentPortIndex = (_currentPortIndex + 1) % peerIds.length;
    savePortIndex(_currentPortIndex);
    return peerId;
  }

  RubixInstance getRubixNode({String? peerId}) {
    try {
      String sPeerId;
      if (peerId == null) {
        // For new create DID requests, we will use the next peerId
        sPeerId = getNextPeerId();
      } else {
        sPeerId = peerId;
      }
      var port = rubixPeerIdPortMap[sPeerId];
      return RubixInstance(sPeerId, port, '127.0.0.1:$port');
    } catch (e) {
      throw RubixException('Invalid peerId');
    }
  }

  void savePortIndex(int index) async {
    final box = await openBox(HiveBox.rubix);
    await box.put(_portMapIndex, index);
    await box.close();
  }

  Future<int> loadPortIndex() async {
    final box = await openBox(HiveBox.rubix);
    var portMapIndex = box.get(_portMapIndex, defaultValue: 0);
    await box.close();
    return portMapIndex;
  }
}

class SecondarySignature {
  bool _verifySignature(
      basic_utils.ECPublicKey publicKey, Uint8List messageBytes, Uint8List signaturebytes) {
    var verifier = ECDSASigner()
      ..init(
        false,
        basic_utils.PublicKeyParameter(publicKey),
      );
    var sequence = basic_utils.ASN1Sequence.fromBytes(signaturebytes);
    var r = (sequence.elements![0] as basic_utils.ASN1Integer).integer;
    var s = (sequence.elements![1] as basic_utils.ASN1Integer).integer;
    var signature = basic_utils.ECSignature(r!, s!);

    var verified = verifier.verifySignature(messageBytes, signature);
    return verified;
  }

  void ecdsaVerify(
      {required String publicKey,
      required String payload,
      required List<int> signature}) {
    var payloadCodeUnits = payload.codeUnits;

    var ecPublicKey = publicKeyFromPem(publicKey);
    var payloadBytes = Uint8List.fromList(payloadCodeUnits);
    var signatureBytes = Uint8List.fromList(signature);

    var verified = _verifySignature(ecPublicKey, payloadBytes, signatureBytes);
    if (!verified) {
      throw GrpcError.unauthenticated('Failed to verify signature');
    }
  }

  basic_utils.ECPublicKey publicKeyFromPem(String publicKeyPem) {
    return basic_utils.CryptoUtils.ecPublicKeyFromPem(publicKeyPem);
  }
}

class AccessTokenJWTClaim extends JwtClaim {
  AccessTokenJWTClaim({
    required String did,
    required DateTime expiry,
    required String peerId,
    required String publicKey,
  }) : super(
          issuer: _issuer,
          subject: did,
          maxAge: Duration(days: 30),
          otherClaims: {
            'type': _RubixTokenType.accessToken.toString(),
            'peerId': peerId,
            'publicKey': publicKey,
          },
        );

  factory AccessTokenJWTClaim.fromJWTClaim(JwtClaim claim) {
    return AccessTokenJWTClaim(
      did: claim.subject!,
      expiry: claim.expiry!,
      peerId: claim.toJson()['peerId'],
      publicKey: claim.toJson()['publicKey'],
    );
  }

  String getDid() {
    return subject!;
  }

  String getPeerId() {
    return toJson()['peerId'];
  }

  String getPublicKey() {
    return toJson()['publicKey'];
  }
}

class AccesToken {
  static final int _accessTokenMaxAge = 30; // days
  static Token get(
      {required String did,
      required String peerId,
      required String publicKey}) {
    final JwtClaim claimSet = AccessTokenJWTClaim(
      did: did,
      expiry: DateTime.now().add(Duration(days: _accessTokenMaxAge)),
      peerId: peerId,
      publicKey: publicKey,
    );
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static AccessTokenJWTClaim verify(String token, {bool checkExpiry = true}) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);
      if (checkExpiry == true) {
        claim.validate(
          issuer: _issuer,
        );
      }

      if (_getClaimType(claim) == _RubixTokenType.accessToken.toString()) {
        return AccessTokenJWTClaim.fromJWTClaim(claim);
      } else {
        throw Exception('Invalid token type');
      }
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }
}

class ChallengeToken {
  static final int _challengeTokenMaxAge = 10; // minutes

  static Token get({required String publicKey}) {
    final JwtClaim claimSet = JwtClaim(
        issuer: _issuer,
        subject: publicKey,
        maxAge: Duration(minutes: _challengeTokenMaxAge),
        otherClaims: {
          'type': _RubixTokenType.challengeToken.toString(),
        });
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static JwtClaim verify(String token) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);

      claim.validate(
        issuer: _issuer,
      );

      if (_getClaimType(claim) == _RubixTokenType.challengeToken.toString()) {
        return claim;
      } else {
        throw Exception('Invalid token type');
      }
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }

  static String getPublicKey(String token) {
    return verify(token).subject!;
  }
}
