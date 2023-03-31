import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:shelf_plus/shelf_plus.dart';

String getTokenString(String token) {
  if (token.startsWith('Bearer ')) {
    token = token.substring(7);
  }
  return token;
}

String extractBearerToken(ServiceCall call) {
  var token = call.clientMetadata!['authorization'];
  if (token == null) {
    throw GrpcError.unauthenticated('No auth token provided');
  }
  return getTokenString(token);
}

String extractBearerTokenFromRequest(Request request) {
  var token = request.headers['authorization'];
  if (token == null) {
    throw HttpException('No auth token provided');
  }
  return getTokenString(token);
}
