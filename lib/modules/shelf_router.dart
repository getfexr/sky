import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

import 'package:sky/rpc/external/external.dart';


Future<void> init ({ required int port}) async {
  var app = Router();
  ExternalService(app);

  var handler = const Pipeline()
      .addMiddleware(corsHeaders(
        originChecker: (origin) {

          print(origin);
          return true;
        }
      ))
      .addHandler(app);

  await io.serve(handler, '0.0.0.0', port);
}