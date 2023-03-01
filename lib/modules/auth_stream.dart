import 'dart:async';
import 'package:sky/modules/jwt.dart';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart'
    as external_listener;
class AuthApprovalStream {
  final StreamController<Token>
      _authApprovalStreamController =
      StreamController<Token>.broadcast();

  Stream<Token> get authApprovalStream =>
      _authApprovalStreamController.stream;

  void approveBrowser(String uuid) {
    _authApprovalStreamController.add(ExternalAccessToken.get(uuid: uuid, scope: ["*"]));
    //  close stream
    _authApprovalStreamController.close();
  }
}

class AuthenticationStream {
  Map<String, AuthApprovalStream> pending = {};

  //Multiple devices scenario is not considered right now.
  static final AuthenticationStream _singleton =
      AuthenticationStream._internal();

  factory AuthenticationStream() {
    return _singleton;
  }

  AuthenticationStream._internal();

  final StreamController<external_listener.AuthPayload>
      _authenticateStreamController =
      StreamController<external_listener.AuthPayload>.broadcast();

  Stream<external_listener.AuthPayload> get authenticateStream =>
      _authenticateStreamController.stream;

  void addAuthenticate(external_listener.AuthPayload authenticate) {
    _authenticateStreamController.add(authenticate);
    pending[authenticate.uuid] = AuthApprovalStream();
  }

  Stream<Token> getApprovedToken(String uuid) {
    return pending[uuid]!.authApprovalStream;
  }

  void approveBrowser(String uuid) {
    pending[uuid]!.approveBrowser(uuid);
  }
}
