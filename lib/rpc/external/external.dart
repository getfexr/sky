import 'dart:convert';
import 'dart:ffi';

// import 'package:grpc/grpc_web.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:sky/modules/auth_stream.dart';
import 'package:sky/modules/jwt.dart';
import 'package:sky/modules/transaction_stream.dart';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart';
import 'package:uuid/uuid.dart';

import 'external_qr.dart';

class TransactionDet {
  String comment;
  String receiver;
  double tokenCount;

  TransactionDet(this.comment, this.receiver, this.tokenCount);

  String toJson() {
    return json.encode({
      'comment': comment,
      'receiver': receiver,
      'tokenCount': tokenCount
    });
  }
}

class ExternalService {
  ExternalService(Router router) {
    router.add('GET', '/external/authenticate', authenticate);
    router.add('POST', '/external/authenticate/wait', awaitAuthentication);
    // router.add('POST', '/external/request-transaction', transactionRequest);
  }

  Future<Response> authenticate(Request request) async {
    try {
      String uuid = Uuid().v4();
      AuthenticationStream().addAuthenticate(AuthPayload(uuid: uuid));

      return Response.ok(
        jsonEncode({
          'qrData': QRAuthenticate(uuid: uuid, scope: ["*"]).getQRData().toMap(),
          'uuid': uuid
        }),
        headers: {
          'Content-Type': 'application/json'
        }
      );
    } catch (e, s) {
      print("error: $e");
      print("stack: $s");
      return Response.internalServerError(body: e.toString);
    }
  }

  Future<Response> awaitAuthentication(Request request) async {
    try {
      var payload  = await request.readAsString();
      var data = json.decode(payload);
      String uuid = data['uuid'];

      Stream<Token> token = AuthenticationStream().getApprovedToken(uuid);

      Stream<String> tokenD =  token.map((event) => jsonEncode({
        'accessToken': event.token,
        'expiresOn': event.expiry.toIso8601String()
      }));

      return Response.ok(
        utf8.encoder.bind(tokenD),
        headers: {
        'Content-Type': 'application/json'
      });
    } catch (e, s) {
      print("error: $e");
      print("stack: $s");
      return Response.internalServerError(body: e.toString);
    }
  }

  // TODO: Implement Transaction Stream
  // Future<Response> transactionRequest(Request request) async {
  //   Stream<TransactionDetails> transactionStream = TransactionStream().transactionStream;
  //   Stream<TransactionDet> tr2 = transactionStream.map(
  //     (event) => TransactionDet(event.comment, event.receiver, event.tokenCount));

  //   return Response.ok(
  //     (await tr2.first).toJson()
  //   );
  // }

  // Future<Response> addTr(Request request) async {
  //   try {
  //     var payload  = await request.readAsString();
  //     print("payload: $payload");
  //     var data = json.decode(payload);

  //     print("data: $data");

  //     var comment = data['comment'];
  //     var receiver = data['receiver'];


  //     TransactionDetails receivedRequest = TransactionDetails(comment: data['comment'],
  //         receiver: data['receiver'], tokenCount: data['tokenCount']);
  //     TransactionStream().addTransaction(receivedRequest);
  //     return Response.ok("success");
  //   } catch (e, s) {
  //     print('Error: $e');
  //     print(s);
  //     return Response.ok("failed");
    // }

}
