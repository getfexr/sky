import 'package:sky/native-interaction/rubix-local.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';

class RubixService extends RubixServiceBase {
  @override
  Future<CreateDIDRes> createDID(ServiceCall call, CreateDIDReq request) async {
    try {
      // CreateDIDRes result = await  RubixLocal().newHotWallet(
      //   did: request.didImage, publicShare: request.publicShare,
      //   pvtKeyPass: request.privateKeyPass);

      // await RubixLocal().sync();
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
        throw GrpcError.unknown('Failed to create new hot wallet');
      }
    }
  }

  @override
  Future<RequestTransactionPayloadRes> initiateTransaction(ServiceCall call, RequestTransactionPayloadReq request) async{
    try {
      RequestTransactionPayloadRes result = await RubixLocal().initiateTransactionPayload(
        receiver: request.receiver,
        tokenCount: request.tokenCount,
        comment: request.comment,
        type: request.type,
        pvtKeyPass: request.privateKeyPass,
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
  Future<TxnSummary> finaliseTransaction(ServiceCall call, FinaliseTransactionPayload request) async {
    try {
      TxnSummary result = await RubixLocal().finaliseTransaction(request: request);
      return result;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to initiate transaction');
      }
    }
  }

  @override
  Future<GetTransactionLogRes> getTransactionLog(ServiceCall call, GetTransactionLogReq request) async {
    try {
      GetTransactionLogRes result = await RubixLocal().getTransactionByCount(
        count: request.count
      );
      return result;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to get transaction log');
      }
    }
  }

  @override
  Future<GetBalanceRes> getBalance(ServiceCall call, Empty request) async {
    try {
      double balance = await RubixLocal().getAccountBalance();
      return GetBalanceRes(balance: balance);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      if (e is RubixException) {
        throw GrpcError.invalidArgument(e.message);
      } else {
        throw GrpcError.unknown('Failed to get account info');
      }
    }
  }
}

