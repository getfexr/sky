import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:sky/config.dart';

final String _secret = Config().jwtAuthSecret;
final String _issuer = 'Fexr Sky';

enum _TokenType {
  access,
  refresh,
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

class AccessToken {
  static final int _accessMaxAge = 10; // days
  static get({ required String address, required String f0 }) {
    final String subject = address;

    final JwtClaim claimSet = JwtClaim(
      issuer: _issuer,
      subject: subject,
      maxAge: Duration(days: _accessMaxAge),
      otherClaims: {
        'f0': f0,
        'type': _TokenType.access.toString(),
      }
    );
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static JwtClaim verify(String token) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);

      claim.validate(
        issuer: _issuer,
      );

      if (_getClaimType(claim) == _TokenType.access.toString()) {
        return claim;
      } else {
        return throw Exception('Invalid token type');
      }
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }
}

class RefreshToken {
  static final int _refreshMaxAge = 30; // days

  static Token get({ required String address, required String f0 }) {
    final String subject = address;

    final JwtClaim claimSet = JwtClaim(
      issuer: _issuer,
      subject: subject,
      maxAge: Duration(days: _refreshMaxAge),
      otherClaims: {
        'f0': f0,
        'type': _TokenType.refresh.toString(),
      }
    );
    return Token(issueJwtHS256(claimSet, _secret), claimSet.expiry!);
  }

  static JwtClaim verify(String token) {
    try {
      final JwtClaim claim = verifyJwtHS256Signature(token, _secret);

      claim.validate(
        issuer: _issuer,
      );

      if (_getClaimType(claim) == _TokenType.refresh.toString()) {
        return claim;
      } else {
        throw Exception('Invalid token type');
      }
    } on JwtException {
      return throw Exception('Invalid token');
    }
  }
}

class ExternalAccessToken {
  static final int _externalAccessMaxAge = 10; // days

  static Token get({ required String uuid, required List<String> scope }) {

    final JwtClaim claimSet = JwtClaim(
      issuer: _issuer,
      subject: uuid,
      maxAge: Duration(days: _externalAccessMaxAge),
      otherClaims: {
        'type': _TokenType.externalAccess.toString(),
        'scope': scope,
      }
    );
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
