import 'package:sky/native-interaction/rubix-local.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';

class RubixService extends RubixServiceBase {
  @override
  Future<CreateDIDRes> createDID(ServiceCall call, CreateDIDReq request) async {
    try {
      CreateDIDRes result = await RubixLocal().createDID(didImgFile: request.didImage, pubImgFile: request.publicShare, pubKeyFile: request.publicKey);
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
  Future<RequestTransactionPayloadRes> initiateTransaction(ServiceCall call, RequestTransactionPayloadReq request) async{
    try {
      RequestTransactionPayloadRes result = await RubixLocal().initiateTransactionPayload(
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
  Future<Status> signResponse(ServiceCall call, HashSigned request){
    try {
      return RubixLocal().signResponse(request: request);
      
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
  Future<RequestTransactionPayloadRes> generateRbt(ServiceCall call, GenerateReq request) {
    try{
      return RubixLocal().generateTestRbt(
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

