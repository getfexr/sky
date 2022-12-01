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

class TransactionLastObjectForJson {
  final String hash;
  final String token;
  final String chainSign;
  TransactionLastObjectForJson(TransactionLastObjectSigned t):
    hash = t.hash,
    token = t.token,
    chainSign = t.chainSign;

  toJson() {
    return {
      'hash': hash,
      'token': token,
      'chainSign': chainSign,
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

class RubixLog {
  static final RubixLog _instance = RubixLog._internal();
  factory RubixLog() {
    return _instance;
  }
  RubixLog._internal();

  String className = 'RubixLog';

  String fileName = 'rubix-local.log';

  void appendLog(String line) {
    if (!Config().debugLog) {
      return;
    }
    File logFile = File(fileName);
    RandomAccessFile raf = logFile.openSync(mode: FileMode.append);
    String dateTime = DateTime.now().toIso8601String();
    raf.writeStringSync("${dateTime} :: ${className} \n ${line} \n");
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

    RubixLog().appendLog("newHotWallet response: ${response.body}");
    var responseData = getRubixResponseJson(response);

    RubixLog().appendLog("newHotWallet response: $responseData");

    var createdECDSA = await generateEcDSAKeys(password: pvtKeyPass);

    RubixLog().appendLog("Created ECDSA keys: $createdECDSA");

    await setupQuorum(password: pvtKeyPass);

    return CreateDIDRes(
      did: responseData['DID'],
      walletId: responseData['walletHash'],
    );
  }

  setupQuorum({ required String password}) async{
    var generatedQuorumKeys = await generateQuorumKeys(password: password);
    RubixLog().appendLog("Generated Quorum keys: $generatedQuorumKeys");

    var startQuorum = await startQuorumService(password: password);
    RubixLog().appendLog("Started Quorum service: $startQuorum");
  }

  Future<Response> generateQuorumKeys({ required String password }) {
    var bodyJson =  jsonEncode(<String, dynamic>
      { "pvtKeyPass" : password, "returnKey" : 0 });

    RubixLog().appendLog("generateQuorumKeys request: $bodyJson");

    return http.post(Uri.http(_url,'/generateQuorumKeys'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson
    );
  }

  Future<Response> startQuorumService({ required String password }) {
    var bodyJson = jsonEncode(<String, String>
          { "pvtKeyPass" : password });

    RubixLog().appendLog("startQuorumService request: $bodyJson");
    return http.post(Uri.http(_url,'/startQuorumService'),
       headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson
    );
  }

  Future<Response> sync() {
    return http.post(Uri.http(_url,'/sync'));
  }

  Future<bool> generateEcDSAKeys({ required String password }) async {
    var jsonBody = jsonEncode(<String, dynamic>{
          'pvtKeyPass': password,
          'returnKey': 0,
    });

    RubixLog().appendLog("generateEcDSAKeys request: $jsonBody");
    var response = await http.post(Uri.http(_url,'/generateEcDSAKeys'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody);

    RubixLog().appendLog("generateEcDSAKeys response: ${response.body}");

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
    await startQuorumService(password: pvtKeyPass); // To restart quorum service in case rubix executable was restarted

    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'receiver': receiver,
      'tokenCount': tokenCount,
      'comment': comment ?? '',
      'type': 2,
      'pvtKeyPass': pvtKeyPass,
    });

    RubixLog().appendLog("initiateTransactionPayload request to rubix: $bodyJsonStr");

    var response = await http.post(Uri.http(_url,'/initiateTransaction'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJsonStr,
      );

    RubixLog().appendLog("initiateTransactionPayload response from rubix: ${response.body}");

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

    RubixLog().appendLog("getAccountBalance response: $balance");
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

    List<TransactionLastObjectForJson> lastObjectsSigned = request.lastObject.map((t) =>
      TransactionLastObjectForJson(t)
    ).toList();

    var body = {
      'authSenderByRecHash': request.authSenderByRecHash.sign,
      'lastObject': lastObjectsSigned,
      'senderPayloadSign': request.senderPayloadSign.sign,
      'pledgeDetails': pledgeDetails,
    };

    var bodyJson = jsonEncode(body);

    RubixLog().appendLog("finaliseTransaction request to RUBIX: $bodyJson");

    var response = await http.post(Uri.http(_url,'/transactionFinality'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson);

    RubixLog().appendLog("finaliseTransaction response from RUBIX: ${response.body}");

    var dataResponse = getRubixResponseJson(response);

    TxnSummary txnSummary = TxnSummary(
      amount: 0,     // TODO: fix this
      comment: dataResponse['message'],
      receiver: dataResponse['receiver'],
      sender: dataResponse['did'],
      txnId: dataResponse['tid']
    );
    return txnSummary;
  }

  Future<GetTransactionLogRes> getTransactionByCount({
    required int count,
  }) async {
    var bodyJson = jsonEncode(<String, dynamic>{
          'txnCount': count,
        });

    RubixLog().appendLog("getTransactionByCount request to RUBIX: $bodyJson");
    var response = await http.post(Uri.http(_url,'/getTxnByCount'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson);

    RubixLog().appendLog("getTransactionByCount response: ${response.body}");
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
