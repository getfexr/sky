import 'package:grpc/grpc.dart';
import 'package:sky/background.dart';
import 'package:sky/config.dart';

import 'package:sky/native_interaction/rubix/rubix_rpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';
import 'package:sky/rpc/external/external_listener.dart';

void startRPCDaemon() async {
  final server = Server(
    [
      RubixService(),
      ExternalListenerService(),
    ],
  );

  await RubixNodeBalancer().setCurrentPortIndex();
  final port = Config().port;
  await server.serve(port: port);
  print('\nSky RPC daemon started on port $port');
  skyInfo();
}

void shutdownRPCDaemon() {}
