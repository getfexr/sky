import 'package:sky/third_party_access/chains/rubix_third_party_service.dart';
import 'package:sky/third_party_access/main.dart';

void main(List<String> args) {
  print("Hello World!");

  RubixThirdPartyService r = RubixThirdPartyService();

  ThirdPartyService t = r;

  // print(t.isGetTransactionsImplemented());
  // print(t.isRequestTransactionImplemented());
  // print(t.isGetUserInfoImplemented());
  print(t.runtimeType);
  print(r.runtimeType);
  print(t.name);
  print(r.scopesAvailable);
}
