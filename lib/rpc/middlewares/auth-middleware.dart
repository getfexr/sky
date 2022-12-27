// Dart GRPC Authorization Middleware

import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:sky/modules/jwt.dart';

class User {
  final String address;
  final String f0;

  User({required this.address, required this.f0});
}

String extractBearerToken(ServiceCall call) {
  var token = call.clientMetadata!['authorization'];
  if (token == null) {
    throw GrpcError.unauthenticated('No auth token provided');
  }
  if (token.startsWith('Bearer ')) {
    token = token.substring(7);
  }
  return token;
}

User getAuthenticatedUser(ServiceCall call) {
  // Verify token
  var token = extractBearerToken(call);
  JwtClaim jc = AccessToken.verify(token);
  return User(address: jc.subject!, f0: jc["f0"]);
}

void authenticateExternalUser(ServiceCall call) {
  var token = extractBearerToken(call);
  JwtClaim jc = ExternalAccessToken.verify(token);
  print(jc);
}

FutureOr<GrpcError?> authMiddleware(
    ServiceCall call, ServiceMethod method) async {
  if (['StreamAuthenticateRequest', 'StreamTransactionRequest','TransactionRequest','Authenticate'].contains(method.name)) {
    authenticateExternalUser(call);
    return null;
  } else if (['Host', 'Refresh', 'CheckConnection'].contains(method.name)) {
    return null;
  } else {
    User user = getAuthenticatedUser(call);
    call.headers!['address'] = user.address;
    call.headers!['f0'] = user.f0;
    return null;
  }
}
