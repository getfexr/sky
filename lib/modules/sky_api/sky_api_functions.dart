import 'dart:convert';

import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/modules/jwt.dart';
import 'package:sky/modules/sky_api/qr_data.dart';
import 'package:sky/modules/sky_api/sky_ext_authentication/external_auth_module.dart';
import 'package:sky/modules/sky_api/sky_ext_authentication/external_auth_stream.dart';

Response externalAuthInitiatation(Request request) {
  print("externalAuthInitiatation");
  var uuid = generateUUID();
  QRData qrData = generateAuthQRCode(uuid: uuid);
  print("qrDataJsonStr: $qrData");
  return Response.ok(jsonEncode({
    "status": true,
    "uuid": uuid,
    "qrData": qrData.toMap(),
  }));
}

Future<Response> respondOnAuthConfirmation(Request request) async {
  var authorizationHeader = request.headers['authorization'];
  if (authorizationHeader == null) {
    return Response.unauthorized(
        {
          "status": false,
          "message": "No authorization header",
        }.toString(),
        headers: {
          "Content-Type": "application/json",
        });
  }

  var token = authorizationHeader;
  if (token.startsWith('Bearer ')) {
    token = token.substring(7);
  }

  AuthData jwt = AuthData.fromToken(token);

  var uuid = jwt.getUuid();

  print("uuid: $uuid");

  Token externalAccessToken = await UUIDTokenStream().getToken(uuid).first;

  return Response.ok(
      {
        "status": true,
        "token": externalAccessToken,
      }.toString(),
      headers: {
        "Content-Type": "application/json",
      });
}
