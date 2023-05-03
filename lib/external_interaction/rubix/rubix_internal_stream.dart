import 'dart:async';


class RubixSignResponse {
  String message;
  String result;
  String did;
  bool status;

  RubixSignResponse({
    required this.message,
    required this.result,
    required this.status,
    required this.did,
  });

}
class RubixSignResponseStream {
  static final RubixSignResponseStream _rubixSignResponseStream =
      RubixSignResponseStream._internal();
  factory RubixSignResponseStream() {
    return _rubixSignResponseStream;
  }

  RubixSignResponseStream._internal();
  final StreamController<RubixSignResponse> _controller = 
      StreamController<RubixSignResponse>.broadcast();
  Stream<RubixSignResponse> get stream => _controller.stream;
  void add(RubixSignResponse request) {
    print('request added is $request');
    _controller.add(request);
  }
  Stream<RubixSignResponse> getStream(String did) {
    print('did in stream is $did');
    return _controller.stream.where((event) => event.did == did);
  }

  void close() {
    _controller.close();
  }

}