import 'package:sky/modules/auth_util.dart';
import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';

class RubixService extends RubixServiceBase {
  AccessTokenJWTClaim getAuthUser(ServiceCall call) {
    try {
      String token = extractBearerToken(call);
      print('accessToken received in getAuthUser = $token');
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
      var challengeString = RubixUtil().returnDIDChallenge(publicKey: request.publicKey);
      print('1......public key is ${request.publicKey}');
      print('1......Challenge String is $challengeString');
            return Future.value(ChallengeString(challenge: challengeString));
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
    try {
        var challengeJWT = request.ecdsaChallengeResponse.payload;
        print('2----Firstlin--------Challenge JWT $challengeJWT');
  RubixUtil().ecdsaVerify(
        payload: challengeJWT,
        signature: request.ecdsaChallengeResponse.signature);
        print('2......Challenge JWT $challengeJWT');
    var publicKeyString = ChallengeToken.getPublicKey(challengeJWT);
    print('2......public key is $publicKeyString');
    CreateDIDRes result = await RubixPlatform().createDID(
        didImgFile: request.didImage,
        pubImgFile: request.publicShare,
        pubKey: publicKeyString);
    print('2......createDIDres $result');
    return result;

    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else if (e is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.unknown('Failed to createDID');
      }
    }
    
  }

  @override
  Future<RequestTransactionPayloadRes> initiateTransaction(
      ServiceCall call, RequestTransactionPayloadReq request) async {
    try {
   //   var user = getAuthUser(call);

      RequestTransactionPayloadRes result =
          await RubixPlatform().initiateTransactionPayload(
        receiver: request.receiver,
        senderDID: 'bafybmid3auqfcx7j323gvo3eik7jdd3n6wqr5s7sfwkjnhevssjzy5gv5q',
        tokenCount: request.tokenCount,
        comment: request.comment,
        type: request.type,
        peerId: '12D3KooWGSoDJpCF8V9Yj2sBu41pbpKn1Kb1rWsRW4GL7Lf2J2F5',
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
     // var user = getAuthUser(call);
      return RubixPlatform()
          .signResponse(request: request, peerId: '12D3KooWGSoDJpCF8V9Yj2sBu41pbpKn1Kb1rWsRW4GL7Lf2J2F5');
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
}
