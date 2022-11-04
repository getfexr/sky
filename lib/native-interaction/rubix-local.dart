import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sky/config.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pb.dart';

class SignedHashForJson {
  late String hash;
  late String sign;
  SignedHashForJson(SignedHash signedHash) {
    hash = signedHash.hash;
    sign = signedHash.sign;
  }
  toJson() {
    return {
      'hash': hash,
      'sign': sign,
    };
  }
}
class RubixException implements Exception {
  late String message;
  RubixException([String msg = 'Invalid value']) {
    message = msg;
  }

  @override
  String toString() {
    return message;
  }
}

class RubixLocal {
  static final RubixLocal _rubixLocal = RubixLocal._internal();
  factory RubixLocal() {
    return _rubixLocal;
  }

  static getRubixResponseJson(http.Response response) {
    var parsed = jsonDecode(response.body);
    if (parsed['status'] == "true") {
      if (parsed['data'] != null) {
        var response =  parsed['data']['response'];
        if (response is String) {
          throw RubixException(response);
        } else {
          return response;
        }
      } else {
        throw RubixException("No data in Rubix response");
      }
    } else {
      var message = parsed?['data']?['response']?['message'];
      if (message != null) {
        throw RubixException(message);
      } else {
        throw RubixException('Failed to get response from Rubix');
      }
    }
  }

  static getRubixAPIData(http.Response response) {
    var parsed = jsonDecode(response.body);
    if (parsed['status'] == "true") {
      if (parsed['data'] != null) {
        return parsed['data'];
      } else {
        throw RubixException("No data in Rubix response");
      }
    } else {
      var message = parsed?['data']?['response']?['message'];
      if (message != null) {
        throw RubixException(message);
      } else {
        throw RubixException('Failed to get response from Rubix');
      }
    }
  }

  RubixLocal._internal();

  final String _url = Config().rubixEndpoint;

  Future<CreateDIDRes> newHotWallet({ required String did, required String publicShare,
    required String pvtKeyPass }) async {
    var response = await http.post(Uri.http(_url,'/newHotWallet'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'didString': did, // base64 encoded
          'publicShareString': publicShare, // base64 encoded
        }));

    var responseData = getRubixResponseJson(response);

    print("newHotWallet response: $responseData");

    var createdECDSA = await generateEcDSAKeys(password: pvtKeyPass);

    print("Created ECDSA keys: $createdECDSA");

    await setupQuorum(pvtKeyPass);

    return CreateDIDRes(
      did: responseData['DID'],
      walletId: responseData['walletHash'],
    );
  }

  setupQuorum(String pvtKeyPass) async{
    var generatedQuorumKeys = await generateQuorumKeys(pvtKeyPass);
    var startQuorum = await startQuorumService(pvtKeyPass);

    print("Generated Quorum keys: $generatedQuorumKeys");
    print("Started Quorum service: $startQuorum");
  }

  Future<Response> generateQuorumKeys(String password) {
    return http.post(Uri.http(_url,'/generateQuorumKeys'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>
          { "pvtKeyPass" : password , "returnKey" : 0 })
    );
  }

  Future<Response> startQuorumService(String password) {
    return http.post(Uri.http(_url,'/startQuorumService'),
       headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>
          { "pvtKeyPass" : password })
    );
  }

  Future<Response> sync() {
    return http.post(Uri.http(_url,'/sync'));
  }

  Future<bool> generateEcDSAKeys({ required String password }) async {
    var response = await http.post(Uri.http(_url,'/generateEcDSAKeys'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'pvtKeyPass': password,
          'returnKey': 0,
        }));

    return jsonDecode(response.body)['status'] == "true";
  }

  Future<RequestTransactionPayloadRes> initiateTransactionPayload({
    required String receiver,
    required double tokenCount,
    String? comment,
    required int type,
    required String pvtKeyPass,
  }) async {
    await sync();

    var response = await http.post(Uri.http(_url,'/initiateTransaction'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'receiver': receiver,
          'tokenCount': tokenCount,
          'comment': comment ?? '',
          'type': 2,
          'pvtKeyPass': pvtKeyPass,
        })
      );

    var responseData = getRubixResponseJson(response);
    List<dynamic> lastObjectDynamic = responseData['lastObject'];

    Iterable<TransactionLastObject> lastObjectIterable =
      lastObjectDynamic.map((e) =>
        TransactionLastObject(hash: e['hash'], token: e['token'])
      ).toList();

    // Map<String, dynamic> pledgeDetailsDynamic = responseData['pledgeDetails'];
    Map<String, PledgeDetail> pledgeDetails = {};

    // pledgeDetailsDynamic.forEach((key, value) {
    //   List<dynamic> hashes = value;

    //   Iterable<String> hashesIterable = hashes.map((e) => e.toString());
    //   pledgeDetails[key] = PledgeDetail(
    //     valueArr: hashesIterable,
    //   );
    // });

    // dynamic is Map<String, List<String>> : TODO: fix this
    List<dynamic> pledgeDetailsDynamic = responseData['pledgeDetails'];
    // [ { "q1": ["h1", "h2"] }, { "q2": ["q2h1"] } ]
    // [ pl.. ]
    for (var pl in pledgeDetailsDynamic) {
      var key = pl.keys.first; // q1
      List<dynamic> hashes = pl[key];

      pledgeDetails[key] = PledgeDetail(
        valueArr: hashes.map((e) => e.toString()).toList(),
      );
    }

    return RequestTransactionPayloadRes(
      authSenderByRecHash: responseData['authSenderByRecHash'],
      lastObject: lastObjectIterable,
      senderPayloadSign: responseData['senderPayloadSign'],
      pledgeDetails: pledgeDetails,
    );
  }

  Future<double> getAccountBalance() async {
    var response = await http.get(Uri.http(_url,'/getAccountInfo'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    var responseData = getRubixResponseJson(response);
    var balance =  responseData['balance'];
    balance = balance is int ? balance.toDouble() : balance;
    return balance;
  }

  Future<TxnSummary>finaliseTransaction({
    required FinaliseTransactionPayload request,
  }) async {
    // Map<String, List<SignedHash>> pledgeDetails = {};
    // request.pledgeDetails.forEach((key, value) {
    //   pledgeDetails[key] = value.valueArr;
    // });
    List<Map<String,List<SignedHashForJson>>> pledgeDetails = [];

    request.pledgeDetails.forEach((key, value) {
      pledgeDetails.add({
        key: value.valueArr.map((e) => SignedHashForJson(e)).toList(),
      });
    });

    var body = {
      'authSenderByRecHash': request.authSenderByRecHash.sign,
      'lastObject': [
        {
          'hash': request.lastObject.first.hash,
          'token': request.lastObject.first.token,
          'chainSign': request.lastObject.first.chainSign,
        }
      ],
      'senderPayloadSign': request.senderPayloadSign.sign,
      'pledgeDetails': pledgeDetails,
    };

    var bodyJson = jsonEncode(body);

    var response = await http.post(Uri.http(_url,'/transactionFinality'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson);

    var dataResponse = getRubixResponseJson(response);

    // TODO: fix this
    TxnSummary txnSummary = TxnSummary(
      amount: 1,
      comment: 'comment',
      receiver: 'receiver',
      sender: 'sender',
      txnId: '12'
    );

    return txnSummary;
    // return TxnSummary(
    //   txnId: dataResponse['tid'],
    //   sender: dataResponse['did'],
    //   receiver: dataResponse['receiver'],
    //   amount: dataResponse['amount-requested'],
    //   comment: dataResponse['comment'],
    // );
  }

  Future<GetTransactionLogRes> getTransactionByCount({
    required int count,
  }) async {
    var response = await http.post(Uri.http(_url,'/getTxnByCount'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'txnCount': count,
        }));
    List<dynamic> dataResponse = getRubixResponseJson(response);

    Iterable<TxnSummary> txnSummaries = dataResponse.map((e) => TxnSummary(
      txnId: e['txn'],
      sender: e['senderDID'],
      receiver: e['receiverDID'],
      amount: e['amount'] is int ? e['amount'].toDouble() : e['amount'],
      comment: e['comment'],
    )).toList();

    return GetTransactionLogRes(
      txnLog: txnSummaries,
    );
  }
}
