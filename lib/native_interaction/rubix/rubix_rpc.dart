import 'package:sky/modules/auth_util.dart';
import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';

class RubixService extends RubixServiceBase {
  AccessTokenJWTClaim getAuthUser(ServiceCall call) {
    try {
      String token = extractBearerToken(call);
      return AccesToken.verify(token);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw GrpcError.unauthenticated('Invalid auth token');
    }
  }

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
      var user = getAuthUser(call);

      RequestTransactionPayloadRes result =
          await RubixPlatform().initiateTransactionPayload(
        receiver: request.receiver,
        senderDID: user.getDid(),
        tokenCount: request.tokenCount,
        comment: request.comment,
        type: request.type,
        peerId: user.getPeerId(),
      );

      return result;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else if (e is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.unknown('Failed to request transaction payload');
      }
    }
  }

  @override
  Future<Status> signResponse(ServiceCall call, HashSigned request) {
    try {
      var user = getAuthUser(call);
      return RubixPlatform()
          .signResponse(request: request, peerId: user.getPeerId());
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
      var user = getAuthUser(call);
      return RubixPlatform().generateTestRbt(
        did: request.did,
        tokenCount: request.tokenCount,
        peerId: user.getPeerId(),
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

  @override
  Future<GetBalanceRes> getBalance(ServiceCall call, Empty request) {
    // TODO: implement getBalance
    throw UnimplementedError();
  }
}
