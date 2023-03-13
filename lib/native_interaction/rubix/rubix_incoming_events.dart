import 'dart:async';
import 'dart:convert';
import 'package:shelf_plus/shelf_plus.dart';

class IncomingTransaction {
  String txnId;
  String senderDID;
  String receiverDID;
  String receiverPeerId;
  double amount;
  double gas;
  String ticker;
  String comment;
  int type;
  String timestamp;

  IncomingTransaction(
      {required this.txnId,
      required this.senderDID,
      required this.receiverDID,
      required this.receiverPeerId,
      required this.amount,
      required this.gas,
      required this.ticker,
      required this.comment,
      required this.type,
      required this.timestamp});

  factory IncomingTransaction.fromJson(Map<String, dynamic> json) {
    return IncomingTransaction(
      txnId: json['txnId'],
      senderDID: json['senderDID'],
      receiverDID: json['receiverDID'],
      receiverPeerId: json['receiverPeerId'],
      amount: json['amount'],
      gas: json['gas'],
      ticker: json['ticker'],
      comment: json['comment'],
      type: json['type'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, Object> toMap() {
    return {
      'txnId': txnId,
      'senderDID': senderDID,
      'receiverDID': receiverDID,
      'receiverPeerId': receiverPeerId,
      'amount': amount,
      'gas': gas,
      'ticker': ticker,
      'comment': comment,
      'type': type,
      'timestamp': timestamp,
    };
  }

  toJson() => jsonEncode(toMap());
}

class IncomingTransactionStream {
  static final IncomingTransactionStream _singleton =
      IncomingTransactionStream._internal();

  factory IncomingTransactionStream() {
    return _singleton;
  }

  IncomingTransactionStream._internal();

  final StreamController<IncomingTransaction> _controller =
      StreamController<IncomingTransaction>.broadcast();

  Stream<IncomingTransaction> get stream => _controller.stream;

  void add(IncomingTransaction incomingTransaction) {
    _controller.add(incomingTransaction);
  }
}

Future<void> handleIncomingTransaction(Request request) async {
  IncomingTransaction txn = await request.body.as(IncomingTransaction.fromJson);
  IncomingTransactionStream().add(txn);
}
