import 'dart:async';

class ExternalAuthState {
  final String uuid;
  final String token;
  final DateTime expiresAt;

  final String chain;

  ExternalAuthState(
      {required this.uuid,
      required this.token,
      required this.expiresAt,
      required this.chain});

  ExternalAuthState.createRubixToken(
      String uuid, String token, DateTime expiresAt)
      : this(uuid: uuid, token: token, expiresAt: expiresAt, chain: 'rubix');
}

class ExternalAuthStream {
  static final ExternalAuthStream _singleton = ExternalAuthStream._internal();

  factory ExternalAuthStream() {
    return _singleton;
  }

  ExternalAuthStream._internal();

  final _controller = StreamController<ExternalAuthState>.broadcast();

  Stream<ExternalAuthState> get stream => _controller.stream;

  void dispose() => _controller.close();

  void add(ExternalAuthState state) => _controller.add(state);

  Future<ExternalAuthState> getApproval(String uuid) {
    return stream.where(((event) => event.uuid == uuid)).first;
  }
}
