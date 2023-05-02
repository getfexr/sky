// import 'dart:async';


// class RubixSignRequest {
//   String did;
//   String requestId;
//   String hash;

//   RubixSignRequest({
//     required this.did,
//     required this.requestId,
//     required this.hash,
//   });

// }
// class RubixSignResponseStream {
//   static final RubixSignResponseStream _rubixSignResponseStream =
//       RubixSignResponseStream._internal();
//   factory RubixSignResponseStream() {
//     return _rubixSignResponseStream;
//   }

//   RubixSignResponseStream._internal();
//   final StreamController<RubixSignRequest> _controller = 
//       StreamController<RubixSignRequest>.broadcast();
//   Stream<RubixSignRequest> get stream => _controller.stream;
//   void add(RubixSignRequest request) {
//     _controller.add(request);
//   }
//   Stream<RubixSignRequest> getStream(String did) {
//     return _controller.stream.where((event) => event.did == did);
//   }

//   void close() {
//     _controller.close();
//   }
// }
