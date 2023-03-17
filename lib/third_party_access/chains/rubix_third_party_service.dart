import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pb.dart';
import 'package:sky/third_party_access/main.dart';

class RubixIdentity implements Identity {
  String did;
  String peerId;

  RubixIdentity(this.did, this.peerId);

  @override
  Map<String, dynamic> toJson() {
    return {
      "did": did,
      "peerId": peerId,
    };
  }
}

class RubixTransaction extends Transaction {
  String senderDid;
  String receiverDID;
  String receiverPeerId;
  double amount;
  String comment;

  RubixTransaction(this.senderDid, this.receiverDID, this.receiverPeerId,
      this.amount, this.comment);

  @override
  Map<String, dynamic> toJson() {
    return {
      "senderDid": senderDid,
      "receiverDID": receiverDID,
      "receiverPeerId": receiverPeerId,
      "amount": amount,
      "comment": comment,
    };
  }
}

class RubixTransactionRequest extends TransactionRequest {
  String receiverDID;
  String receiverPeerId;
  double amount;
  String comment;

  RubixTransactionRequest(
      this.receiverDID, this.receiverPeerId, this.amount, this.comment);

  @override
  Map<String, dynamic> toJson() {
    return {
      "receiverDID": receiverDID,
      "receiverPeerId": receiverPeerId,
      "amount": amount,
      "comment": comment,
    };
  }
}

class UserInfo implements JSONEncodable {
  String did;
  String peerId;
  double balance;

  UserInfo(this.did, this.peerId, this.balance);

  @override
  Map<String, dynamic> toJson() {
    return {
      "did": did,
      "peerId": peerId,
      "balance": balance,
    };
  }
}

class RubixThirdPartyService extends ThirdPartyService
    implements
        TransactionsReadable<RubixIdentity, RubixTransaction>,
        TransactionRequestable<RubixIdentity, RubixTransactionRequest>,
        TransactionRequestStreamable<RubixIdentity, RubixTransactionRequest>,
        UserInfoReadable<RubixIdentity> {
  RubixThirdPartyService() : super("RubixChain");
  @override
  Future<List<RubixTransaction>> getTransactions(RubixIdentity identity) {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }

  @override
  Future<UserInfo> getUserInfo(RubixIdentity identity) async {
    GetBalanceRes balance = await RubixPlatform()
        .getBalance(dId: identity.did, peerId: identity.peerId);

    return Future.value(
        UserInfo(identity.did, identity.peerId, balance.balance));
  }

  @override
  Future requestTransaction(
      RubixIdentity identity, TransactionRequest transaction) {
    // TODO: implement requestTransaction
    throw UnimplementedError();
  }

  @override
  Stream<RubixTransactionRequest> streamTransactionRequest(
      RubixIdentity identity) {
    // TODO: implement requestTransaction
    throw UnimplementedError();
  }
}
