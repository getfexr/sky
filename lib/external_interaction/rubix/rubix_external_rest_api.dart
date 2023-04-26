import 'dart:convert';
import 'dart:io';

import 'package:http_server/http_server.dart';
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
  CustomRoute(HttpVerb.post, '/create-data-token', createDataToken),
  CustomRoute(HttpVerb.post, '/commit-data-token',commitDataToken ),
  CustomRoute(HttpVerb.get, '/get-data-token', getDataToken)
];

ExternalAccessTokenJWTClaim getExternalUser(Request request) {
  var token = extractBearerTokenFromRequest(request);
  return ExternalAccessTokenJWTClaim.fromToken(token);
}

OrgAccessTokenJWTClaim getOrgUser(Request request) {
  var token = extractBearerTokenFromRequest(request);
  return OrgAccessTokenJWTClaim.fromToken(token);
}
// String getOrgUser(Request request) {
//   var token = extractBearerTokenFromRequest(request);
//   return token;
// }

Future<Response> handleTransactionRequest(Request request) async {
  var body = await request.body.as(RubixTransactionRequest.fromJson);
  var externalUser = getExternalUser(request);

  var payload = RubixTransactionPayload.fromRequest(
      body, externalUser.getDID(), externalUser.getUuid());
  RubixTransactionRequestStream().add(payload);

  return Response.ok('Transaction request received');
}

// Future<Response> createDataToken(Request request) async {
//   print("start");
  
//   var base64=request.context["fileContent"];
//   print(base64);
//    var formData=request.context['form'] as Map<String,dynamic>;

//    final file= formData['FileContent'] as HttpBodyFileUpload;

//   var requestInfo = http.MultipartRequest('POST',Uri.http('http://localhost:6943/sky/external/rubix/create-data-token'));

  
//    List<int> fileBytes = await File(file.filename).readAsBytes();
   

//     // Encode the file as a Base64-encoded string
//    String base64File = base64Encode(fileBytes);
//    print(base64File);

//   //  requestInfo.files.add(http.MultipartFile.fromBytes(
//   //       'did_image', base64.decode(base64File),
//   //       filename: file.filename));

//   requestInfo.fields['username'] = 'john.doe';
//   requestInfo.fields['email'] = 'john.doe@example.com';
//   requestInfo.fields['mobile'] = 'john.doe@example.com';
  
//    var tempresponse = await requestInfo.send();
//    print(tempresponse);




//   var body = request.body;
//   print('body in createdatatoken ${body.toString()}');
//  // var orgUser = getOrgUser(request);
//   var payload = jsonEncode(request.body);
//   print('payload body = $payload');
//   // var userId = body.
//   // var userInfo = jsonEncode(body['UserInfo']);
//   // var committerDid = jsonEncode(body['CommitterDID']);
//   // var batchId = jsonEncode(body['BatchID']);
//   // var fileInfo = jsonEncode(body['FileInfo']);
//   // var fileContent = body['FileContent'];
//   // RubixPlatform().createDataToken(userId, userInfo, committerDid, batchId, fileInfo, fileContent);
//   return Response.ok('Data token created');
// }
Future<Response> getDataToken(Request request) async {
  var user = getOrgUser(request);
  var peerId = user.getPeerId();
  var did = user.getDID();
  var orgName = user.getOrgName(); 
  var response = await RubixPlatform().getAsset(did: did, peerId: peerId);
  var batchID = response.assets.toString();
  return Response.ok('Got Data Token');
}
Future<Response> createDataToken(Request request) async {
  var body = await request.body.asJson;
  print('body in createdatatoken ${body.toString()}');
  var orgUser = getOrgUser(request);
  var did = jsonEncode(body['did']);
  var userId = jsonEncode(body['UserID']);
  var userInfo = jsonEncode(body['UserInfo']);
  var committerDid = jsonEncode(body['CommitterDID']);
  var fileInfo = jsonEncode(body['FileInfo']);
  var fileContent = [0,0,0];
  await RubixPlatform().createDataToken(userId, userInfo, committerDid, '', fileInfo,fileContent);
  return Response.ok('Data token created');
}

Future<Response> commitDataToken(Request request) async {
  var body = await request.body.asJson;
  print('body in commitdatatoken ${body.toString()}');
  var orgUser = getOrgUser(request);
  var did = jsonEncode(body['did']);
  var batchId = jsonEncode(body['batchID']);
  await RubixPlatform().commitDataToken(did, batchId,'test-token');
  return Response.ok('Data token committed');
}
//  TODO: write accesstoken test mode for testing app fexr
