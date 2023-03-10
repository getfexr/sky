import 'package:grpc/grpc.dart' as grpc;
import 'package:sky/background.dart';
import 'package:sky/config.dart';
import 'package:sky/modules/shelf_plus_module.dart';

import 'package:sky/native_interaction/rubix/rubix_rpc.dart';
import 'package:sky/rpc/external/external_listener.dart';

void startRPCDaemon() async {
  final server = grpc.Server(
    [
      RubixService(),
      ExternalListenerService(),
    ],
  );

  final port = Config().port;

  await Future.wait([
    server.serve(port: port),
    serve(port + 1),
  ]);

  print('\nSky RPC daemon started on port $port');
  print('Sky REST API listening on port ${port + 1}\n');
  skyInfo();
}
