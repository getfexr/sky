import 'dart:async';

import 'package:sky/modules/jwt.dart';

class UUIDAuthResponse {
  final Token token;
  final String uuid;
  UUIDAuthResponse(this.token, this.uuid);
}

class UUIDTokenStream {
  static final UUIDTokenStream _singleton = UUIDTokenStream._internal();

  factory UUIDTokenStream() {
    return _singleton;
  }

  UUIDTokenStream._internal();

  final _controller = StreamController<UUIDAuthResponse>.broadcast();

  Stream<UUIDAuthResponse> get stream => _controller.stream;

  void set(UUIDAuthResponse approval) {
    _controller.add(approval);
  }

  Stream<Token> getToken(String uuid) {
    return stream
        .where((event) => event.uuid == uuid)
        .map((event) => event.token);
  }
}
