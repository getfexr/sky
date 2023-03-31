import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/external_interaction/rubix/rubix_external_rest_api.dart';
import 'package:sky/external_interaction/sky_external_receiver.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

// Sub routes
import 'package:sky/native_interaction/rubix/rubix_rest_api_handlers.dart';

var endpoints = [
  CustomRoute(HttpVerb.get, '/ping', (Request request) => Response.ok('pong')),
];

var registeredSubRoutes = [];
// Register sub routes here

Handler init() {
  var app = Router().plus;

  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders(headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': '*',
      }))
      .addHandler(app);

  addSubroute('/sky/external', skyExternalReceiver);
  addSubroute('/rubix', rubixSubRoutes);

  addSubroute('/sky/external/rubix', externalRubixApiHandlers);
  for (var route in endpoints) {
    app.add(route.verb.string, route.route, route.handler);
  }

  // Print routes
  print('Registered routes:');
  for (var route in endpoints) {
    print('${route.verb.string.toUpperCase()}: ${route.route}');
  }

  return handler;
}

void addSubroute(String subRoutePrefix, List<CustomRoute> subroute) {
  if (!subRoutePrefix.startsWith('/')) {
    subRoutePrefix = '/$subRoutePrefix';
  }

  if (registeredSubRoutes.contains(subRoutePrefix)) {
    throw Exception('Subroute $subRoutePrefix already registered');
  } else {
    registeredSubRoutes.add(subRoutePrefix);
  }

  for (var route in subroute) {
    var routePath = route.route;
    if (!routePath.startsWith('/')) {
      routePath = '/$routePath';
    }
    var fullRoute = '$subRoutePrefix$routePath';
    endpoints.add(CustomRoute(route.verb, fullRoute, route.handler));
  }
}

Future serve(port) async => shelfRun(init,
    defaultBindPort: port,
    defaultBindAddress: '0.0.0.0',
    defaultEnableHotReload: false);
