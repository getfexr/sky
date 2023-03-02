import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';

class RubixService extends RubixServiceBase {
  @override
  Future<ChallengeString> createDIDChallenge(ServiceCall call, Empty request) {
    // TODO: implement createDIDChallenge
    throw UnimplementedError();
  }

  @override
  Future<CreateDIDRes> createDID(ServiceCall call, CreateDIDReq request) async {
    try {
      CreateDIDRes result = await RubixPlatform().createDID(
          didImgFile: request.didImage,
          pubImgFile: request.publicShare,
          pubKeyFile: request.publicKey);
      print('Public Key is ${request.publicKey}');
      print(' result is $result');
      return result;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to create wallet');
      }
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
