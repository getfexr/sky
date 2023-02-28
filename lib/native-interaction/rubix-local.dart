import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
  TransactionLastObjectForJson(TransactionLastObjectSigned t)
      : hash = t.hash,
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
    raf.writeStringSync("$dateTime :: $className \n $line \n");
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
        var response = parsed['data']['response'];
        if (response is String) {
          throw RubixException(response);
        } else if (response is Map) {
          var status = parsed?['data']?['response']?['status'];
          if (status == 'Failed') {
            var message = parsed?['data']?['response']?['message'];
            throw RubixException(message);
          } else {
            return response;
          }
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

 // final String _url = Config().rubixEndpoint;
  final String _url = 'localhost:20007';
  //TODO:Support multiple ports

  Future<CreateDIDRes> createDID(
      {required String didImgFile,
      required String pubImgFile,
      required pubKeyFile}) async {
    const didFileName = 'did.png';
    const pubShareFileName = 'pubShare.png';
    const pubKeyFileName = 'pubKey.pem';
    var request =
        http.MultipartRequest('POST', Uri.http(_url, 'api/createdid'));
    request.fields['did_config'] = jsonEncode({
      'Type': 2,
      'DIDImgFileName': didFileName,
      'PubImgFile': pubShareFileName,
      'PubKeyFile': pubKeyFileName,
    });
    // String publickey1 = pubKeyFile;
    // print(publickey1);
    // var base64decode = base64.decode(publickey1);
    // print(base64decode);
    // var string = String.fromCharCodes(base64decode);
    // print(string);
    //convert publicKeyFile to Uint8List
    //  var pub = pubKeyFile.codeUnits as List<int>;
    //  print(pub);
  //    var pubKeyFile1 = Uint8List.fromList(pubKeyFile);
  //    print(pubKeyFile1);
  //    //convert publicKeyFile to String
     
  //   //  print(utf82);
    
  //  //   print(string);
  //   var publickeystring = String.fromCharCodes(pubKeyFile1);
  //   var utf82 = utf8.encode(publickeystring);
  //     var string = utf8.decode(utf82);
  //   print(utf82);
  //   print(publickeystring);
  // var string = encodekey(pubKeyFile);
    request.files.add(http.MultipartFile.fromBytes(
        'did_image', base64.decode(didImgFile),
        filename: didFileName));
    request.files.add(http.MultipartFile.fromBytes(
        'pub_image', base64.decode(pubImgFile),
        filename: pubShareFileName));
    request.files.add(http.MultipartFile.fromBytes(
        'pub_key', base64.decode(pubKeyFile),
        filename: pubKeyFileName));

    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    RubixLog().appendLog("createDID response: $responseString");
    Map<String, dynamic> jsonResponse = jsonDecode(responseString);
    bool status = jsonResponse['status'];
    String did = "";
    String peerId = "";
    String result = "";
    if (status == true) {
      
      did = jsonResponse['result']['did'];
      peerId = jsonResponse['result']['peer_id'];
      result = '$peerId.$did' ;
      RubixLog().appendLog("Did Created Successfully $result");
    } else {
      RubixLog().appendLog("Did Creation Failed");
    }
    return CreateDIDRes(did: result, status: status);
  }


  Future<RequestTransactionPayloadRes> initiateTransactionPayload({
    required String receiver,
    required String sender,
    required double tokenCount,
    String? comment,
    required int type,
  }) async {

    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'receiver': receiver,
      'sender': sender,
      'tokenCOunt': tokenCount,
      'comment': comment ?? '',
      'type': 2,
    });

    RubixLog()
        .appendLog("initiateTransactionPayload request to rubix: $bodyJsonStr");

    var response = await http.post(
      Uri.http(_url, '/api/initiate-rbt-transfer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );

    RubixLog().appendLog(
        "initiateTransactionPayload response from rubix: ${response.body}");

    var responseJson = jsonDecode(response.body);
    var hashForSign = responseJson['result']['hash'];
    var requestId = responseJson['result']['id'];
    return RequestTransactionPayloadRes(
      requestId: requestId ,
      hash: hashForSign
    );

  }

  Future<RequestTransactionPayloadRes> generateTestRbt({required String did, required double tokenCount}) async{
  var bodyJsonStr = jsonEncode(<String, dynamic>{
      'number_of_tokens': tokenCount.ceil(),
      'did': did,
    });

    RubixLog()
        .appendLog("generateTestRbt request to rubix: $bodyJsonStr");
        
        var response = await http.post(
      Uri.http(_url, '/api/generate-test-token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
        body: bodyJsonStr,
        );
        RubixLog().appendLog("generateTestRbt response from rubix: ${response.body}");
        var responseJson = jsonDecode(response.body);
        var hashForSign = responseJson['result']['hash'];
        var requestId = responseJson['result']['id'];
        return RequestTransactionPayloadRes(
        requestId: requestId,
          hash: hashForSign
        );
  }
  
  Future<Status> signResponse(
      {required HashSigned request
      }) async {

    var signature = jsonEncode(<String, dynamic>{
      'Signature': request.pvtSign,
      'Pixels': '',
    });

    
    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'id': request.id,
      'signature': signature,
});
    RubixLog().appendLog("signResponse request to rubix: $bodyJsonStr");
    var response = await http.post(
      Uri.http(_url, '/api/sign-response'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );
    var responseJson = jsonDecode(response.body);
    var status = responseJson['status'];
    return Status(status: status);



  }

  Future<double> getAccountBalance() async {
    var response = await http
        .get(Uri.http(_url, '/getAccountInfo'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var responseData = getRubixResponseJson(response);
    var balance = responseData['balance'];
    balance = balance is int ? balance.toDouble() : balance;

    RubixLog().appendLog("getAccountBalance response: $balance");
    return balance;
  }

  Future<TxnSummary> finaliseTransaction({
    required FinaliseTransactionPayload request,
  }) async {
    // Map<String, List<SignedHash>> pledgeDetails = {};
    // request.pledgeDetails.forEach((key, value) {
    //   pledgeDetails[key] = value.valueArr;
    // });
    List<Map<String, List<SignedHashForJson>>> pledgeDetails = [];

    request.pledgeDetails.forEach((key, value) {
      pledgeDetails.add({
        key: value.valueArr.map((e) => SignedHashForJson(e)).toList(),
      });
    });

    List<TransactionLastObjectForJson> lastObjectsSigned =
        request.lastObject.map((t) => TransactionLastObjectForJson(t)).toList();

    var body = {
      'authSenderByRecHash': request.authSenderByRecHash.sign,
      'lastObject': lastObjectsSigned,
      'senderPayloadSign': request.senderPayloadSign.sign,
      'pledgeDetails': pledgeDetails,
    };

    var bodyJson = jsonEncode(body);

    RubixLog().appendLog("finaliseTransaction request to RUBIX: $bodyJson");

    var response = await http.post(Uri.http(_url, '/transactionFinality'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson);

    RubixLog()
        .appendLog("finaliseTransaction response from RUBIX: ${response.body}");

    var dataResponse = getRubixResponseJson(response);

    TxnSummary txnSummary = TxnSummary(
        amount: 0, // TODO: fix this
        comment: dataResponse['message'],
        receiver: dataResponse['receiver'],
        sender: dataResponse['did'],
        txnId: dataResponse['tid']);
    return txnSummary;
  }

  Future<GetTransactionLogRes> getTransactionByCount({
    required int count,
  }) async {
    var bodyJson = jsonEncode(<String, dynamic>{
      'txnCount': count,
    });

    RubixLog().appendLog("getTransactionByCount request to RUBIX: $bodyJson");
    var response = await http.post(Uri.http(_url, '/getTxnByCount'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson);

    RubixLog().appendLog("getTransactionByCount response: ${response.body}");
    List<dynamic> dataResponse = getRubixResponseJson(response);

    Iterable<TxnSummary> txnSummaries = dataResponse
        .map((e) => TxnSummary(
              txnId: e['txn'],
              sender: e['senderDID'],
              receiver: e['receiverDID'],
              amount: e['amount'] is int ? e['amount'].toDouble() : e['amount'],
              comment: e['comment'],
            ))
        .toList();

    return GetTransactionLogRes(
      txnLog: txnSummaries,
    );
  }
}
