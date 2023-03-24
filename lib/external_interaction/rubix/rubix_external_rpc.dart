import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/native-interaction/rubix-external.pbgrpc.dart';

class RubixExternalService extends RubixExternalServiceBase {
  @override
  Future<Empty> approveAuthRequest(ServiceCall call, AuthRequest request) {
    // TODO: implement approveAuthRequest
    throw UnimplementedError();
  }

  @override
  Stream<TxnRequest> streamTransactionRequest(ServiceCall call, Empty request) {
    // TODO: implement streamTransactionRequest
    throw UnimplementedError();
  }
}
