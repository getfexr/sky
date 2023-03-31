import 'dart:convert';

import 'package:shelf_plus/shelf_plus.dart';
import 'package:sky/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:sky/native_interaction/rubix/rubix_incoming_events.dart';

class ApiResponse {
  bool status;
  String message;
  Object result;

  ApiResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory ApiResponse.success({String? message, Map<String, dynamic>? data}) {
    return ApiResponse(
      status: true,
      message: message ?? 'success',
      result: data ?? {},
    );
  }

  factory ApiResponse.error({String? message}) {
    return ApiResponse(
      status: false,
      message: message ?? 'error',
      result: {},
    );
  }

  Map<String, Object> toMap() {
    return {
      'status': status,
      'message': message,
      'result': result,
    };
  }

  String toJson() => jsonEncode(toMap());
}

List<CustomRoute> rubixSubRoutes = [
  CustomRoute(
      HttpVerb.get, '/ping', (Request request) => Response.ok('pong:rubix')),
  CustomRoute(HttpVerb.post, '/events/incoming-transaction',
      (Request request) async {
    try {
      // TODO: Add validation
      // TODO: Add security
      await handleIncomingTransaction(request);
      return Response.ok(ApiResponse.success().toJson());
    } catch (e, s) {
      print(e);
      print(s);
      return Response.unauthorized(
          ApiResponse.error(message: "Failed to update transaction stream")
              .toJson());
    }
  }),
];
