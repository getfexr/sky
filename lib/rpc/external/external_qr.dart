import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:uuid/uuid.dart';
import 'package:sky/config.dart';

String _getClaimType(JwtClaim claim) {
  return claim.toJson()['type'];
}
class QRData {
  String data;
  DateTime expiry;
  String type;

  QRData(this.data, this.expiry, this.type);

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'expiry': expiry.toIso8601String(),
      'type': type,
    };
  }
}

 class QRJWT {
  final String _secret = Config().jwtAuthSecret;
  final String _issuer = 'Fexr Sky External';

  String type;
  QRJWT({required this.type});

  JwtClaim getJwtClaim() {
    throw UnimplementedError();
  }

  JwtClaim verify(String token) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);

      claim.validate(
        issuer: _issuer,
      );

      if (_getClaimType(claim) != type) {
        return throw Exception('Invalid token type');
      }

      return claim;
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }

   QRData getQRData() {
    JwtClaim claim = getJwtClaim();

    DateTime expiry = claim.expiry!;
    String data = issueJwtHS256(claim,  _secret);

    return QRData(data, expiry, type);
  }
}

class QRAuthenticate extends QRJWT {
  String uuid;
  List<String> scope;

  QRAuthenticate({ required this.uuid, required this.scope })
      : super(type: 'QRAuthenticate');

  @override
  JwtClaim getJwtClaim() {
    return JwtClaim(
      issuer: _issuer,
      subject: uuid,
      expiry: DateTime.now().add(Duration(seconds: 30)),
      otherClaims: {
        'scope': scope,
        'type': type,
      }
    );
  }
}