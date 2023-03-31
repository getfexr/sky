import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/external_interaction/ext_auth_stream.dart';
import 'package:sky/external_interaction/qr.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:uuid/uuid.dart';

var skyExternalReceiver = [
  CustomRoute(
      HttpVerb.get, '/ping', (Request request) => Response.ok('pong:sky:ext')),
  CustomRoute(HttpVerb.get, '/auth/qr-data', handleRequestForAuthQRData),
  CustomRoute(HttpVerb.get, '/auth/await-approval', handleAwaitForAuthApproval),
];

class Resp {
  static Map<String, dynamic> success({dynamic data}) {
    return {
      'success': true,
      'data': data,
    };
  }

  static Map<String, dynamic> error({dynamic error}) {
    return {
      'success': false,
      'error': error,
    };
  }
}

Response handleRequestForAuthQRData(Request request) {
  try {
    var uuid = Uuid().v4();
    AuthenticationQR qr = AuthenticationQR.forUuid(uuid);
    return IResponse.json(
      Resp.success(data: {
        'qr': {
          'data': qr.data,
          'expiresAt': qr.expiresAt.toIso8601String(),
          'type': qr.type.string,
          'uuid': qr.getUuid(),
        },
      }),
    );
  } catch (e) {
    print(e);
    return IResponse.json(
      Resp.error(error: "Failed to generate QR code"),
    );
  }
}

Future<Response> handleAwaitForAuthApproval(Request request) async {
  try {
    var uuid = request.url.queryParameters['uuid'];
    if (uuid == null) {
      return IResponse.json(
        Resp.error(error: 'Missing uuid'),
      );
    }

    var approval = await ExternalAuthStream().getApproval(uuid);

    return IResponse.json(
      Resp.success(data: {
        'approved': true,
        'accessToken': approval.token,
        'expiresAt': approval.expiresAt.toIso8601String(),
      }),
    );
  } catch (e, s) {
    print(e);
    print(s);
    return IResponse.json(
      Resp.error(error: "Error in approval stream"),
    );
  }
}
