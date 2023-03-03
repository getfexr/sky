// Dart GRPC Authorization Middleware
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';

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
