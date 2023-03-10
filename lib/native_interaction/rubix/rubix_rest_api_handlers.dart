import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';

SubRoute rubixSubRoutes = SubRoute('/rubix', [
  CustomRoute('get', '/ping', (Request request) => 'pong:rubix'),
]);
