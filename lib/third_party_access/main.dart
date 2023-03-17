import 'dart:mirrors';

import 'package:sky/modules/utils.dart';

abstract class JSONEncodable {
  Map<String, dynamic> toJson();
}

class Scope {
  static const readTransactions = "read:transactions";
  static const readUserInfo = "read:user_info";
  static const requestTransaction = "request:transaction";
}

// Custom Type
abstract class ChainProp {}

abstract class Identity extends JSONEncodable {}

abstract class Transaction extends JSONEncodable {}

abstract class TransactionRequest extends JSONEncodable {}

abstract class TransactionsReadable<I extends Identity, T extends Transaction>
    extends ChainProp {
  Future<List<T>> getTransactions(I identity);
}

abstract class TransactionRequestStreamable<I extends Identity,
    T extends TransactionRequest> {
  Stream<T> streamTransactionRequest(I identity);
}

abstract class TransactionRequestable<I extends Identity,
    T extends TransactionRequest> extends ChainProp {
  Future<dynamic> requestTransaction(I identity, T transactionRequest);
}

abstract class UserInfoReadable<I extends Identity> extends ChainProp {
  Future<JSONEncodable> getUserInfo(I identity);
}

List<Type> getImplementedChainProp(dynamic obj) {
  List<ClassMirror> implementedTypes = getImplementedAbstractClasses(obj);

  return implementedTypes
      .where((element) {
        return element.superclass?.reflectedType == ChainProp;
      })
      .map((e) => e.reflectedType)
      .toList();
}

class ThirdPartyService {
  static final Set<String> _usedNames = <String>{};
  static final scopeClassMap = BiMap<String, Type>.fromMap({
    Scope.readTransactions: TransactionsReadable,
    Scope.requestTransaction: TransactionRequestable,
    Scope.readUserInfo: UserInfoReadable,
  });

  String name;

  late List<String> scopesAvailable;

  ThirdPartyService(this.name) {
    if (_usedNames.contains(name)) {
      throw ArgumentError('Name already used: $name');
    }
    _usedNames.add(name);

    List<String> getAvailableChainProps() {
      List<Type> implementedTypes = getImplementedChainProp(this);
      return implementedTypes.map((e) => scopeClassMap.reverse(e)).toList();
    }

    scopesAvailable = getAvailableChainProps();
  }
}
