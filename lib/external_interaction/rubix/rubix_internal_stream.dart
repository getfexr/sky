import 'dart:async';


class RubixSignResponse {
  String message;
  String result;
  bool status;

  RubixSignResponse({
    required this.message,
    required this.result,
    required this.status,
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
    _controller.add(request);
  }
  Stream<RubixSignResponse> getStream(String did) {
    return _controller.stream.where((event) => event.status == true);
  }

  void close() {
    _controller.close();
  }

}