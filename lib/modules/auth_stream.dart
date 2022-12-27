import 'dart:async';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart'
    as external_listener;



class AuthApprovalStream {
  final StreamController<bool>
      _authApprovalStreamController =
      StreamController<bool>.broadcast();
      
  Stream<bool> get authApprovalStream =>
      _authApprovalStreamController.stream;

  void approveBrowser() {
    _authApprovalStreamController.add(true);
    //  close stream
    // _authApprovalStreamController.close();
    
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

  final StreamController<external_listener.Authenticate>
      _authenticateStreamController =
      StreamController<external_listener.Authenticate>.broadcast();

  Stream<external_listener.Authenticate> get authenticateStream =>
      _authenticateStreamController.stream;

  void addAuthenticate(external_listener.Authenticate authenticate) {
    _authenticateStreamController.add(authenticate);
    pending[authenticate.browserId] = AuthApprovalStream();
  }

  Future<bool> getResult(String browserId) {
    Stream<bool> stream = pending[browserId]!.authApprovalStream;
    return stream.first;
  }

  void approveBrowser(String browserId) {
    pending[browserId]!.approveBrowser();
  }
}