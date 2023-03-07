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

void ecdsaVerify({required String payload, required List<int> signature}){
    JwtClaim jwtClaim = ChallengeToken.verify(payload);
    String publicKeyString = jwtClaim.subject!;
    var publicKey = fexr.KeyPair().publicKeyFromPem(publicKeyString);
    var payloadCodeUnits = payload.codeUnits;
    var payloadBytes = Uint8List.fromList(payloadCodeUnits);
    var signatureBytes = Uint8List.fromList(signature);
    var verified = verifySignature(publicKey, payloadBytes, signatureBytes);
    if (!verified) {
      throw GrpcError.unauthenticated('Failed to verify signature');
    }
}
