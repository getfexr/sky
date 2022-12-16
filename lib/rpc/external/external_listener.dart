import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:sky/modules/auth_stream.dart';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';

class ExternalListenerService extends ExternalListenerServiceBase {
  @override
  Stream<Authenticate> streamAuthenticateRequest(
      ServiceCall call, Empty request) {
    return AuthenticationStream().authenticateStream;
  }

  @override
  Future<ApproveBrowserRes> approveBrowser(
      ServiceCall call, Authenticate request) {
    AuthenticationStream().approveBrowser(request.browserId);
    return Future.value(ApproveBrowserRes(status: true));
  }

  Stream<Authenticate> streamAuthenticate(ServiceCall call, Empty request) {
    ExternalListenerService service = ExternalListenerService();

    return service.streamAuthenticateRequest(call, request).asBroadcastStream();
  }
  Stream<TransactionDetails> streamTransaction(ServiceCall call, Empty request){
    ExternalListenerService service = ExternalListenerService();
    return service.streamTransactionRequest(call, request).asBroadcastStream();
  }
  
  @override
  Stream<TransactionDetails> streamTransactionRequest(
      ServiceCall call, Empty request) {
    return TransactionStream().transactionStream;
  }
}
