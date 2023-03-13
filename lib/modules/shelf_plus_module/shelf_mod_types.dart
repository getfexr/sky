import 'package:shelf_plus/shelf_plus.dart';

// Enum class for HTTP verbs
enum HttpVerb { get, post, put, delete, patch, head, options, trace }

// Enum to string conversion
extension HttpVerbExtension on HttpVerb {
  String get string {
    return toString().split('.').last;
  }
}

class CustomRoute {
  HttpVerb verb;
  String route;
  Handler handler;
  Middleware? localMiddleware;

  CustomRoute(this.verb, this.route, this.handler, {this.localMiddleware});
}

class SubRoute {
  String route;
  List<CustomRoute> endpoints;

  SubRoute(this.route, this.endpoints);
}
