// Dart GRPC Authorization Middleware
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';
import 'package:sky/modules/jwt.dart';
import 'package:fexr/fexr.dart' as fexr;

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


