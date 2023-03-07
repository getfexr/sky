import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';

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
    var challengeJWT = request.ecdsaChallengeResponse.payload;
    RubixUtil().ecdsaVerify(
        payload: challengeJWT,
        signature: request.ecdsaChallengeResponse.signature);
    var publicKeyString = ChallengeToken.getPublicKey(challengeJWT);
    CreateDIDRes result = await RubixPlatform().createDID(
        didImgFile: request.didImage,
        pubImgFile: request.publicShare,
        pubKey: publicKeyString);
    return result;
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
