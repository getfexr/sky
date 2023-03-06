import 'package:sky/third_party_access/main.dart';

class RubixTransaction implements JSONEncodable {
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class TransactionRequest implements JSONEncodable {
  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class UserInfo implements JSONEncodable {
  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class RubixThirdPartyService extends ThirdPartyService
    implements
        TransactionsReadable,
        TransactionRequestable,
        TransactionRequestStreamable,
        UserInfoReadable {
  RubixThirdPartyService() : super("RubixChain");
  @override
  Future<List<RubixTransaction>> getTransactions() {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }

  @override
  Stream<TransactionRequest> streamTransactionRequest() {
    // TODO: implement requestTransaction
    throw UnimplementedError();
  }

  @override
  Future<UserInfo> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future requestTransaction(dynamic) {
    // TODO: implement requestTransaction
    throw UnimplementedError();
  }
}
