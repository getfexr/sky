import 'package:grpc/grpc.dart' as grpc;
import 'package:sky/background.dart';
import 'package:sky/config.dart';
import 'package:sky/external_interaction/rubix/rubix_external_rpc.dart';
import 'package:sky/router/router.dart' as shelf;

import 'package:sky/native_interaction/rubix/rubix_rpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';

void startRPCDaemon() async {
  final server = grpc.Server(
    [
      RubixService(),
      RubixExternalService(),
    ],
  );

  await RubixNodeBalancer().setCurrentPortIndex();
  final port = Config().port;

  await Future.wait([
    server.serve(port: port),
    shelf.serve(port + 1),
  ]);

  print('\nSky RPC daemon started on port $port');
  print('Sky REST API listening on port ${port + 1}\n');
  skyInfo();
}
