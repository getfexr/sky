import 'dart:convert';

import 'package:shelf_plus/shelf_plus.dart';

// Enum class for HTTP verbs
enum HttpVerb { get, post, put, delete, patch, head, options, trace }

// Enum to string conversion
extension HttpVerbExtension on HttpVerb {
  String get string {
    return toString().split('.').last;
  }
}

class IResponse {
  static Response json(Map<String, dynamic> body,
      {Map<String, String>? headers}) {
    return Response.ok(jsonEncode(body), headers: headers);
  }
}

class CustomRoute {
  HttpVerb verb;
  String route;
  Handler handler;
  Middleware? localMiddleware;

  CustomRoute(this.verb, this.route, this.handler, {this.localMiddleware});
}
