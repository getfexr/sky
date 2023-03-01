import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:sky/modules/auth_stream.dart';
import 'package:sky/modules/transaction_stream.dart';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart' as pb;
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/rpc/external/external_qr.dart';

class ExternalListenerService extends pb.ExternalListenerServiceBase {
  @override
  Stream<pb.AuthPayload> streamAuthenticateRequest(
      ServiceCall call, Empty request) {
    return AuthenticationStream().authenticateStream;
  }

  @override
  Future<pb.ApproveBrowserRes> approveBrowser(
      ServiceCall call, pb.QRData request) {
    try {
      JwtClaim claim = QRJWT(type: 'QRAuthenticate').verify(request.data);

      var uuid = claim.subject!;

      AuthenticationStream().approveBrowser(uuid);
      return Future.value(pb.ApproveBrowserRes(status: true));
    }
    catch (e, s) {
      print(e);
      print(s);
    }

    return Future.value(pb.ApproveBrowserRes(status: false));
  }

  @override
  Stream<pb.TransactionDetails> streamTransactionRequest(
      ServiceCall call, Empty request) {
    return TransactionStream().transactionStream;
  }
}
