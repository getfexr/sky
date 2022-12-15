import 'dart:async';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart'
    as external_listener;

class AuthenticationStream {
  //Multiple devices scenario is not considered right now.
  static final AuthenticationStream _singleton =
      AuthenticationStream._internal();

  factory AuthenticationStream() {
    return _singleton;
  }

  AuthenticationStream._internal();

  final StreamController<external_listener.Authenticate>
      _authenticateStreamController =
      StreamController<external_listener.Authenticate>.broadcast();

  Stream<external_listener.Authenticate> get authenticateStream =>
      _authenticateStreamController.stream;

  void addAuthenticate(external_listener.Authenticate authenticate) {
    _authenticateStreamController.add(authenticate);
  }
}