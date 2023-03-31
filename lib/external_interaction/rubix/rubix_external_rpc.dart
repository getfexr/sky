import 'package:sky/external_interaction/ext_auth_stream.dart';
import 'package:sky/external_interaction/rubix/rubix_txn_request_stream.dart';
import 'package:sky/native_interaction/rubix/rubix_rpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/native-interaction/rubix-external.pbgrpc.dart';

class RubixExternalService extends RubixExternalServiceBase {
  @override
  Future<Empty> approveAuthRequest(ServiceCall call, AuthRequest request) {
    var user = RubixService.getAuthUser(call);

    var did = user.getDid();
    var peerId = user.getPeerId();
    var uuid = request.uuid;

    Token tokenObj =
        ExternalAccessToken.get(did: did, peerId: peerId, uuid: uuid);

    ExternalAuthStream().add(ExternalAuthState.createRubixToken(
        request.uuid, tokenObj.token, tokenObj.expiry));
    return Future.value(Empty());
  }

  @override
  Stream<TxnRequest> streamTransactionRequest(ServiceCall call, Empty request) {
    var user = RubixService.getAuthUser(call);
    var did = user.getDid();

    return RubixTransactionRequestStream().getStream(did).map((event) {
      var comment = event.comment;
      if (event.uuid.isNotEmpty) {
        comment = "$comment (uuid: ${event.uuid})";
      }
      return TxnRequest()
        ..amount = event.amount
        ..comment = comment
        ..receiver = event.receiver;
    });
  }
}
