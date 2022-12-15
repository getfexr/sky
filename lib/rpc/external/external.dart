import 'package:grpc/grpc.dart';
import 'package:sky/modules/auth_stream.dart';
import 'package:sky/protogen/external/external-listener.pb.dart';
import 'package:sky/protogen/external/external.pbgrpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';

class ExternalService extends ExternalServiceBase {
  @override
  Future<AuthenticateRes> authenticate(ServiceCall call, Empty) async {
    //TODO: Get consent from mobile App
    //Generate accesToken and send to extension
    AuthenticationStream().addAuthenticate(Authenticate(browserId: "Boom"));

    return AuthenticateRes(accessToken: "", status: "");
  }
}
