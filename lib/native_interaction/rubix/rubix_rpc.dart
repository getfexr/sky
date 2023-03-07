import 'dart:typed_data';

import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:sky/modules/jwt.dart';
import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';
import 'package:sky/modules/auth_util.dart';
import 'package:fexr/fexr.dart' as fexr;

class RubixService extends RubixServiceBase {
  @override
  Future<ChallengeString> createDIDChallenge(
      ServiceCall call, ChallengeReq request) {
    try {
      return RubixUtil().createDIDChallenge(publicKey: request.publicKey);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to create challenge');
      }
    }
  }

  @override
  Future<CreateDIDRes> createDID(ServiceCall call, CreateDIDReq request) async {
    String challengeToken = request.ecdsaChallengeResponse.payload;
    JwtClaim jwtClaim = ChallengeToken.verify(challengeToken);
    String publicKeyString = jwtClaim.subject!;
    var publicKey = fexr.KeyPair().publicKeyFromPem(publicKeyString);
    var payloadCodeUnits = request.ecdsaChallengeResponse.payload.codeUnits;
    var payloadBytes = Uint8List.fromList(payloadCodeUnits);
    var signatureList = request.ecdsaChallengeResponse.signature;
    var signatureBytes = Uint8List.fromList(signatureList);
    var verified = verifySignature(publicKey, payloadBytes, signatureBytes);

    if (!verified) {
      throw RubixException('Signature verification failed');
    } else {
      CreateDIDRes result = await RubixPlatform().createDID(
          didImgFile: request.didImage,
          pubImgFile: request.publicShare,
          pubKeyFile: publicKeyString);
      return result;
    }
  }

  @override
  Future<RequestTransactionPayloadRes> initiateTransaction(
      ServiceCall call, RequestTransactionPayloadReq request) async {
    try {
      RequestTransactionPayloadRes result =
          await RubixPlatform().initiateTransactionPayload(
        receiver: request.receiver,
        sender: request.sender,
        tokenCount: request.tokenCount,
        comment: request.comment,
        type: request.type,
      );

      return result;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to request transaction payload');
      }
    }
  }

  @override
  Future<Status> signResponse(ServiceCall call, HashSigned request) {
    try {
      return RubixPlatform().signResponse(request: request);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to sign response');
      }
    }
  }

  @override
  Future<RequestTransactionPayloadRes> generateRbt(
      ServiceCall call, GenerateReq request) {
    try {
      return RubixPlatform().generateTestRbt(
        did: request.did,
        tokenCount: request.tokenCount,
      );
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to generate RBT');
      }
    }
  }
}
