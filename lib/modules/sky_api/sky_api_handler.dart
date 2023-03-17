import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:sky/modules/sky_api/sky_api_functions.dart' as handler;

SubRoute skyRoutes = SubRoute('/sky', [
  CustomRoute(
      HttpVerb.get, '/ping', (Request request) => Response.ok('pong:sky')),
  CustomRoute(
      HttpVerb.get, '/external/auth/qr-data', handler.externalAuthInitiatation),
  CustomRoute(HttpVerb.get, '/external/auth/confirm',
      handler.respondOnAuthConfirmation),
]);
