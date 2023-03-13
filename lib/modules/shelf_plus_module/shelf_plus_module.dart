import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';

// Sub routes
import 'package:sky/native_interaction/rubix/rubix_rest_api_handlers.dart';

var endpoints = [
  CustomRoute(HttpVerb.get, '/ping', (Request request) => Response.ok('pong')),
];

// Register sub routes here
List<SubRoute> subRoutes = [
  rubixSubRoutes,
];

Handler init() {
  var app = Router().plus;

  for (var subroute in subRoutes) {
    addSubroute(subroute);
  }

  for (var route in endpoints) {
    app.add(route.verb.string, route.route, route.handler);
  }

  return app;
}

void addSubroute(SubRoute subroute) {
  var subRoutePrefix = subroute.route;
  if (!subRoutePrefix.startsWith('/')) {
    subRoutePrefix = '/$subRoutePrefix';
  }

  for (var route in subroute.endpoints) {
    var routePath = route.route;
    if (!routePath.startsWith('/')) {
      routePath = '/$routePath';
    }
    var fullRoute = '$subRoutePrefix$routePath';
    endpoints.add(CustomRoute(route.verb, fullRoute, route.handler));
  }
}

Future serve(port) async => shelfRun(init, defaultBindPort: port);
