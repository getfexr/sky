import 'dart:convert';

import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/external_interaction/rubix/rubix_txn_request_stream.dart';
import 'package:sky/modules/auth_util.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';
import 'package:http/http.dart' as http;

var externalRubixApiHandlers = [
  CustomRoute(HttpVerb.get, '/ping', (Request request) => Response.ok('pong')),
  CustomRoute(HttpVerb.post, 'request-transaction', handleTransactionRequest),
  CustomRoute(HttpVerb.post, '/create-data-token',createDataToken ),
  CustomRoute(HttpVerb.post, '/commit-data-token',commitDataToken ),
];

ExternalAccessTokenJWTClaim getExternalUser(Request request) {
  var token = extractBearerTokenFromRequest(request);
  return ExternalAccessTokenJWTClaim.fromToken(token);
}

OrgAccessTokenJWTClaim getOrgUser(Request request) {
  var token = extractBearerTokenFromRequest(request);
  return OrgAccessTokenJWTClaim.fromToken(token);
}

Future<Response> handleTransactionRequest(Request request) async {
  var body = await request.body.as(RubixTransactionRequest.fromJson);
  var externalUser = getExternalUser(request);

  var payload = RubixTransactionPayload.fromRequest(
      body, externalUser.getDID(), externalUser.getUuid());
  RubixTransactionRequestStream().add(payload);

  return Response.ok('Transaction request received');
}

Future<Response> createDataToken(Request request) async {
  var body = await request.body.asJson;
  print('body in createdatatoken ${body.toString()}');
  var orgUser = getOrgUser(request);
  var payload = jsonEncode(request.body);
  var userId = jsonEncode(body['UserID']);
  var userInfo = jsonEncode(body['UserInfo']);
  var committerDid = jsonEncode(body['CommitterDID']);
  var batchId = jsonEncode(body['BatchID']);
  var fileInfo = jsonEncode(body['FileInfo']);
  var fileContent = body['FileContent'];
  RubixPlatform().createDataToken(userId, userInfo, committerDid, batchId, fileInfo, fileContent);
  return Response.ok('Data token created');
}

Future<Response> commitDataToken(Request request) async {
  var body = await request.body.asJson;
  print('body in commitdatatoken ${body.toString()}');
  var orgUser = getOrgUser(request);
  var did = jsonEncode(body['did']);
  var batchId = jsonEncode(body['batchID']);
  RubixPlatform().commitDataToken(did, batchId);
  return Response.ok('Data token committed');
}
//  TODO: write accesstoken test mode for testing app fexr
