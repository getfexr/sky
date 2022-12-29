import 'dart:async';
import 'package:sky/protogen/external/external-listener.pbgrpc.dart'
    as external_listener;
    
    class TransactionStream {

    static final TransactionStream _singleton = TransactionStream._internal();
    factory TransactionStream() {
        return _singleton;
    }

    TransactionStream._internal();

    final StreamController<external_listener.TransactionDetails>
        _transactionStreamController =
        StreamController<external_listener.TransactionDetails>.broadcast();

    Stream<external_listener.TransactionDetails> get transactionStream =>
        _transactionStreamController.stream;
    
    void addTransaction(external_listener.TransactionDetails transactionDetails) {
        _transactionStreamController.add(transactionDetails);
  }
  
  }