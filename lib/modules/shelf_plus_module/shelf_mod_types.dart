import 'package:shelf_plus/shelf_plus.dart';

class CustomRoute {
  String verb;
  String route;
  Function handler;
  Middleware? localMiddleware;

  CustomRoute(this.verb, this.route, this.handler, {this.localMiddleware});
}

class SubRoute {
  String route;
  List<CustomRoute> endpoints;

  SubRoute(this.route, this.endpoints);
}
