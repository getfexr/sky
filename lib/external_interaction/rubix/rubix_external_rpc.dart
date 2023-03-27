import 'package:sky/external_interaction/ext_auth_stream.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/native-interaction/rubix-external.pbgrpc.dart';

class RubixExternalService extends RubixExternalServiceBase {
  @override
  Future<Empty> approveAuthRequest(ServiceCall call, AuthRequest request) {
    var token = 'fake-token';
    // TODO: Generate external access token for rubix
    var expiresAt = DateTime.now().add(Duration(days: 30));

    ExternalAuthStream().add(
        ExternalAuthState.createRubixToken(request.uuid, token, expiresAt));
    return Future.value(Empty());
  }

  @override
  Stream<TxnRequest> streamTransactionRequest(ServiceCall call, Empty request) {
    // TODO: implement streamTransactionRequest
    throw UnimplementedError();
  }
}
