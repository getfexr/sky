// Dart GRPC Authorization Middleware
import 'package:grpc/grpc.dart';

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
