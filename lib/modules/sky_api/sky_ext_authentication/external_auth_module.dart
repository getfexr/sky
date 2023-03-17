import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:sky/config.dart';
import 'package:sky/modules/sky_api/qr_data.dart';
import 'package:uuid/uuid.dart';

String generateUUID() {
  return Uuid().v4();
}

class AuthData {
  JwtClaim claim;
  static String jwtType = 'externalLogin';

  AuthData(this.claim);

  factory AuthData.fromUuid(String uuid) {
    var jwt = _getClaim(uuid);
    return AuthData(jwt);
  }

  factory AuthData.fromToken(String token) {
    var jwt = verifyJwtHS256Signature(token, Config().jwtAuthSecret);
    if (jwt.toJson()['type'] != jwtType) {
      throw Exception('Invalid token type');
    }
    return AuthData(jwt);
  }

  String getUuid() {
    return claim.subject!;
  }

  DateTime getExpiry() {
    return claim.expiry!;
  }

  static JwtClaim _getClaim(uuid) {
    return JwtClaim(
        issuer: 'sky',
        subject: uuid,
        maxAge: Duration(seconds: 33),
        otherClaims: {
          'type': jwtType,
        });
  }

  toJWTToken() {
    return issueJwtHS256(claim, Config().jwtAuthSecret);
  }
}

QRData generateAuthQRCode({required String uuid}) {
  var authData = AuthData.fromUuid(uuid);
  var token = authData.toJWTToken();

  var qrData = QRData(token, authData.getExpiry(), QRType.externalLogin);

  return qrData;
}
