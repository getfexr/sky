import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';

var skyExternalReceiver = [
  CustomRoute(
      HttpVerb.get, '/ping', (Request request) => Response.ok('pong:sky:ext')),
  CustomRoute(HttpVerb.get, '/auth/qr-data', handleRequestForAuthQRData),
  CustomRoute(HttpVerb.get, '/auth/await-approval', handleAwaitForAuthApproval),
];

Response handleRequestForAuthQRData(Request request) {
  throw UnimplementedError();
}

Response handleAwaitForAuthApproval(Request request) {
  throw UnimplementedError();
}
