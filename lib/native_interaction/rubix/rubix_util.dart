import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pb.dart';
import 'package:fexr/fexr.dart' as fexr;
import 'package:sky/config.dart';

final String _secret = Config().jwtAuthSecret;
final String _issuer = 'Fexr Sky';

enum _RubixTokenType {
  challengeToken,
  accessToken,
}

String _getClaimType(JwtClaim claim) {
  return claim.toJson()['type'];
}

class Token {
  final String token;
  final DateTime expiry;

  Token(this.token, this.expiry);
}
class RubixUtil {
  Future<ChallengeString> createDIDChallenge({required String publicKey}) {
    final challengeToken = ChallengeToken.get(publicKey: publicKey);
    return Future.value(ChallengeString(
      challenge: challengeToken.token,
    ));
  }

  bool verifySignature(
    ECPublicKey publicKey, Uint8List messageBytes, Uint8List signaturebytes) {
  var verifier = ECDSASigner()
    ..init(
      false,
      PublicKeyParameter(publicKey),
    );
  var sequence = ASN1Sequence.fromBytes(signaturebytes);
  var r = (sequence.elements![0] as ASN1Integer).integer;
  var s = (sequence.elements![1] as ASN1Integer).integer;
  var signature = ECSignature(r!, s!);

  var verified = verifier.verifySignature(messageBytes, signature);
  return verified;
}

void ecdsaVerify({required String payload, required List<int> signature}){
    JwtClaim jwtClaim = ChallengeToken.verify(payload);
    String publicKeyString = jwtClaim.subject!;
    var publicKey = fexr.KeyPair().publicKeyFromPem(publicKeyString);
    var payloadCodeUnits = payload.codeUnits;
    var payloadBytes = Uint8List.fromList(payloadCodeUnits);
    var signatureBytes = Uint8List.fromList(signature);
    var verified = verifySignature(publicKey, payloadBytes, signatureBytes);
    if (!verified) {
      throw GrpcError.unauthenticated('Failed to verify signature');
    }
}
}

class AccesToken {
  static final int _accessTokenMaxAge = 30; // days

  static Token get({required String did, required String peerId, required String publicKey}) {
    final JwtClaim claimSet = JwtClaim(
        issuer: _issuer,
        subject: did,
        maxAge: Duration(days: _accessTokenMaxAge),
        otherClaims: {
          'type': _RubixTokenType.accessToken.toString(),
          'peerId': peerId,
          'publicKey': publicKey,
        });
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static JwtClaim verify(String token) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);
      claim.validate(
        issuer: _issuer,
      );

      if (_getClaimType(claim) == _RubixTokenType.accessToken.toString()) {
        return claim;
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