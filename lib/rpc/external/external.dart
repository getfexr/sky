import 'package:grpc/grpc.dart';
import 'package:sky/modules/auth_stream.dart';
import 'package:sky/modules/transaction_stream.dart';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart';
import 'package:sky/protogen/external/external.pbgrpc.dart' as external_;
import 'package:sky/protogen/google/protobuf/empty.pb.dart';

class ExternalService extends external_.ExternalServiceBase {
  @override
  Future<external_.AuthenticateRes> authenticate(ServiceCall call, Empty request) async {
    //Generate accesToken and send to extension
    
    AuthenticationStream().addAuthenticate(Authenticate(browserId: ''));

    bool res = await AuthenticationStream().getResult('');
    return external_.AuthenticateRes(accessToken: "", status: res ? "success" : "failed");
  }

  @override
  Future<external_.TransactionRes> transactionRequest(
      ServiceCall call, external_.TransactionDetails request) {
        TransactionDetails receivedRequest = TransactionDetails(comment: request.comment,
        receiver: request.receiver, tokenCount: request.tokenCount);
        TransactionStream().addTransaction(receivedRequest);

        return Future.value(external_.TransactionRes(status: "success"));
  }
}
