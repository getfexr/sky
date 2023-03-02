import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:sky/config.dart';

final String _secret = Config().jwtAuthSecret;
final String _issuer = 'Fexr Sky';

enum _TokenType {
  externalAccess,
}

String _getClaimType(JwtClaim claim) {
  return claim.toJson()['type'];
}

class Token {
  final String token;
  final DateTime expiry;

  Token(this.token, this.expiry);
}

class ExternalAccessToken {
  static final int _externalAccessMaxAge = 10; // days

  static Token get({required String browserId}) {
    final JwtClaim claimSet = JwtClaim(
        issuer: _issuer,
        subject: browserId,
        maxAge: Duration(days: _externalAccessMaxAge),
        otherClaims: {
          'type': _TokenType.externalAccess.toString(),
        });
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static JwtClaim verify(String token) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);

      claim.validate(
        issuer: _issuer,
      );

      if (_getClaimType(claim) == _TokenType.externalAccess.toString()) {
        return claim;
      } else {
        throw Exception('Invalid token type');
      }
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }
}
