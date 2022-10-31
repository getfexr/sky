// Dart GRPC Authorization Middleware

import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:sky/modules/jwt.dart';

class User {
  final String address;
  final String f0;

  User({required this.address, required this.f0});
}

User getAuthenticatedUser(ServiceCall call) {
  var token = call.clientMetadata!['authorization'];
  if (token == null) {
    throw GrpcError.unauthenticated('No auth token provided');
  }

  // Verify token
  if (token.startsWith('Bearer ')) {
    token = token.substring(7);
  }

  JwtClaim jc = AccessToken.verify(token);
  return User(address: jc.subject!, f0: jc["f0"]);
}
