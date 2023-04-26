import 'dart:async';
import 'dart:convert';

class RubixTransactionRequest {
  String? receiver;
  double? amount;
  String? comment;
  String? requestId;
  String? hash;

  RubixTransactionRequest({
     this.receiver,
     this.amount,
     this.comment,
     this.requestId,
     this.hash
  });

  factory RubixTransactionRequest.fromJson(Map<String, dynamic> json) {
    print("json: $json");
    print(jsonEncode(json));
    var amount = json['amount'];
    if (amount is int) {
      amount = amount.toDouble();
    }
    return RubixTransactionRequest(
        amount: amount, receiver: json['receiver'], comment: json['comment']);
  }
}

class RubixTransactionPayload extends RubixTransactionRequest {
  String sender;
  String uuid;

  RubixTransactionPayload({
    required this.sender,
    required this.uuid,
    required String? receiver,
    required double? amount,
    required String? comment,
    String? requestId,
    String? hash,
  }) : super(receiver: receiver, amount: amount, comment: comment, requestId: requestId,hash: hash);

  factory RubixTransactionPayload.fromRequest(
      RubixTransactionRequest request, String sender, String uuid) {
    return RubixTransactionPayload(
        sender: sender,
        uuid: uuid,
        receiver: request.receiver,
        amount: request.amount,
        comment: request.comment);
  }
}

class RubixTransactionRequestStream {
  static final RubixTransactionRequestStream _rubixTransactionRequestStream =
      RubixTransactionRequestStream._internal();
  factory RubixTransactionRequestStream() {
    return _rubixTransactionRequestStream;
  }

  RubixTransactionRequestStream._internal();

  final StreamController<RubixTransactionPayload> _controller =
      StreamController<RubixTransactionPayload>.broadcast();

  Stream<RubixTransactionPayload> get stream => _controller.stream;

  void add(RubixTransactionPayload txnRequestPayload) {
    print("Adding txn request for sender: ${txnRequestPayload.sender}");
    _controller.add(txnRequestPayload);
  }

  Stream<RubixTransactionPayload> getStream(String did) {
    return _controller.stream.where((event) => event.sender == did);
  }

  void close() {
    _controller.close();
  }
}
