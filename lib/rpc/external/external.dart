import 'package:grpc/grpc.dart';
import 'package:sky/modules/auth_stream.dart';
import 'package:sky/protogen/external/external-listener.pb.dart';
import 'package:sky/protogen/external/external.pbgrpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';

class ExternalService extends ExternalServiceBase {
  @override
  Future<AuthenticateRes> authenticate(ServiceCall call, Empty request) async {
    //TODO: Get consent from mobile App
    //Generate accesToken and send to extension
    var bid = "Boom";
    AuthenticationStream().addAuthenticate(Authenticate(browserId: bid));

    bool res = await AuthenticationStream().getResult(bid);
    return AuthenticateRes(accessToken: "", status: res ? "success" : "failed");
  }
  
  @override
  Future<RequestTransactionRes> transactionRequest(ServiceCall call, RequestTransactionDetails request) {
    // TODO: implement transactionRequest
    throw UnimplementedError();
  }

}
