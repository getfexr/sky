import 'dart:convert';
import 'dart:io';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'package:sky/config.dart';
import 'package:sky/external_interaction/rubix/rubix_sign_response_stream.dart';
import 'package:sky/external_interaction/rubix/rubix_txn_request_stream.dart';
import 'package:sky/native_interaction/rubix/rubix_incoming_events.dart';
import 'package:sky/native_interaction/rubix/rubix_rpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart' as util;
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/google/protobuf/timestamp.pb.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pb.dart';

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
    raf.closeSync();
  }
}

class RubixInstance {
  String peerId;
  int port;
  String url;
  RubixInstance(this.peerId, this.port, this.url);
}

class RubixPlatform {
  static final RubixPlatform _rubixPlatform = RubixPlatform._internal();
  factory RubixPlatform() {
    return _rubixPlatform;
  }
  var rubixNodeBalancer = util.RubixNodeBalancer();

  RubixPlatform._internal();

  Future<CreateDIDRes> createDID(
      {required String didImgFile,
      required String pubImgFile,
      required String pubKey}) async {
    const didFileName = 'did.png';
    const pubShareFileName = 'pubShare.png';
    const pubKeyFileName = 'pubKey.pem';

    var rubixNode = rubixNodeBalancer.getRubixNode();
    var url = rubixNode.url;

    var request = http.MultipartRequest('POST', Uri.http(url, 'api/createdid'));
    request.fields['did_config'] = jsonEncode({
      'Type': 2,
      'DIDImgFileName': didFileName,
      'PubImgFile': pubShareFileName,
      'PubKeyFile': pubKeyFileName,
    });
    request.files.add(http.MultipartFile.fromBytes(
        'did_image', base64.decode(didImgFile),
        filename: didFileName));
    request.files.add(http.MultipartFile.fromBytes(
        'pub_image', base64.decode(pubImgFile),
        filename: pubShareFileName));
    request.files.add(http.MultipartFile.fromString('pub_key', pubKey,
        filename: pubKeyFileName));

    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    RubixLog().appendLog("createDID response: $responseString");
    Map<String, dynamic> jsonResponse = jsonDecode(responseString);
    bool status = jsonResponse['status'];
    if (status == true) {
      String did = jsonResponse['result']['did'];
      String peerId = jsonResponse['result']['peer_id'];
      util.Token accessToken =
          util.AccesToken.get(did: did, peerId: peerId, publicKey: pubKey);

      String result = '$peerId.$did';
      RubixLog().appendLog("Did Created Successfully $result");
      return CreateDIDRes(
          did: result,
          status: status,
          accessToken: Token(
              accessToken: accessToken.token,
              expiry: Timestamp.fromDateTime(accessToken.expiry)));
    } else {
      RubixLog().appendLog("Did Creation Failed");
      throw RubixException("Did Creation Failed");
    }
  }

  Future<RequestTransactionPayloadRes> initiateTransactionPayload({
    required String receiver,
    required String senderDID,
    required double tokenCount,
    String? comment,
    required int type,
    required String peerId,
  }) async {
    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'receiver': receiver,
      'sender': "$peerId.$senderDID",
      'tokenCOunt': tokenCount,
      'comment': comment ?? '',
      'type': 2,
    });

    RubixLog()
        .appendLog("initiateTransactionPayload request to rubix: $bodyJsonStr");

    var response = await http.post(
      Uri.http(rubixNodeBalancer.getRubixNode(peerId: peerId).url,
          '/api/initiate-rbt-transfer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );

    RubixLog().appendLog(
        "initiateTransactionPayload response from rubix: ${response.body}");
    var responseJson = jsonDecode(response.body);
    var status = responseJson['status'];
    if (status == false) {
      throw RubixException(responseJson['message']);
    }
    var hashForSign = responseJson['result']['hash'];
    var requestId = responseJson['result']['id'];
    return RequestTransactionPayloadRes(
        requestId: requestId, hash: hashForSign);
  }

  Future<String> createDataToken(
      String userId,
      String userInfo,
      String committerDid,
      String batchId,
      String fileInfo,
      List<int> fileContent) async {
    var peerId = committerDid.split('.').first;
    var url = rubixNodeBalancer.getRubixNode(peerId: peerId).url;
    var request =
        http.MultipartRequest('POST', Uri.http(url, '/api/create-data-token'));
    request.fields['UserID'] = userId;
    request.fields['UserInfo'] = userInfo;
    request.fields['CommitterDID'] = committerDid;
    request.fields['BatchID'] = batchId;
    request.fields['FileInfo'] = fileInfo;
    request.files.add(http.MultipartFile.fromBytes('FileContent', fileContent,
        filename: 'file'));
    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    Map<String, dynamic> responseJson = jsonDecode(responseString);
    var status = responseJson['status'];
    if (status == false) {
      throw RubixException(responseJson['message']);
    }
    var hashForSign = responseJson['result']['hash'];
    var requestId = responseJson['result']['id'];
    var transactionRequest = RubixTransactionPayload(sender:'V-guard',uuid: 'peerId.did', requestId: requestId,hash: hashForSign,receiver: committerDid,amount: 0,comment: 'Create Data Token Request');
    RubixTransactionRequestStream().add(transactionRequest);
    // var signRequest = RubixSignRequest(
    //     did: committerDid, requestId: requestId, hash: hashForSign);
    // RubixSignResponseStream().add(signRequest);
    return Future.value('Data Token Created');
  }

  Future<String> commitDataToken(String did, String batchId, String token) async {
    var peerId = did.split('.').first;
    var token = 'test-token';
    var url = rubixNodeBalancer.getRubixNode(peerId: peerId).url;
    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'did': did,
      'batchID': batchId,
    });
    var response = await http.post(
      Uri.http(url, '/api/commit-data-token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );
    var responseString = response.body;
    Map<String, dynamic> responseJson = jsonDecode(responseString);
    var status = responseJson['status'];
    if (status == false) {
      throw RubixException(responseJson['message']);
    }
    var hashForSign = responseJson['result']['hash'];
    var requestId = responseJson['result']['id'];
    var transactionRequest = RubixTransactionPayload(sender:'V-guard',uuid: 'peerId.did', requestId: requestId,hash: hashForSign,receiver: did,amount: 0,comment: 'Create Data Token Request');
    RubixTransactionRequestStream().add(transactionRequest);
    // var signRequest =
    //     RubixSignRequest(did: did, requestId: requestId, hash: hashForSign);
    // RubixSignResponseStream().add(signRequest);
    return Future.value('Data token Commited');
  }

  Stream<IncomingTxnDetails> streamIncomingTxn({
    required String did,
    required String peerId,
  }) {
    return IncomingTransactionStream()
        .stream
        .where((event) =>
            event.receiverDID == did && event.receiverPeerId == peerId)
        .map((event) => IncomingTxnDetails(
            txnId: event.txnId,
            sender: event.senderDID,
            receiver: event.receiverDID,
            amount: event.amount,
            comment: event.comment,
            type: event.type,
            timestamp: Timestamp.fromDateTime(DateTime.parse(event.timestamp)),
            tickerName: event.ticker,
            gas: event.gas));
  }

  Future<RequestTransactionPayloadRes> generateTestRbt(
      {required String did,
      required double tokenCount,
      required String peerId}) async {
    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'number_of_tokens': tokenCount.ceil(),
      'did': did,
    });

    RubixLog().appendLog("generateTestRbt request to rubix: $bodyJsonStr");

    var response = await http.post(
      Uri.http(rubixNodeBalancer.getRubixNode(peerId: peerId).url,
          '/api/generate-test-token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );
    RubixLog()
        .appendLog("generateTestRbt response from rubix: ${response.body}");
    var responseJson = jsonDecode(response.body);
    var hashForSign = responseJson['result']['hash'];
    var requestId = responseJson['result']['id'];
    return RequestTransactionPayloadRes(
        requestId: requestId, hash: hashForSign);
  }

  Future<Status> signResponse(
      {required HashSigned request, required String peerId}) async {
    var signature = <String, dynamic>{
      'Signature': request.pvtSign,
      'Pixels': request.imgSign,
    };

    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'id': request.id,
      'signature': signature,
    });
    RubixLog().appendLog("signResponse request to rubix: $bodyJsonStr");
    var response = await http.post(
      Uri.http(rubixNodeBalancer.getRubixNode(peerId: peerId).url,
          '/api/signature-response'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );
    RubixLog().appendLog("sigResponse response from rubix: ${response.body}");
    var responseJson = jsonDecode(response.body);
    var status = responseJson['status'];
    if (status == false) {
      throw RubixException(responseJson['message']);
    }
    return Status(status: status);
  }

  Future<GetBalanceRes> getBalance(
      {required String dId, required String peerId}) async {
    var url = Uri.http(rubixNodeBalancer.getRubixNode(peerId: peerId).url,
        'api/get-account-info', {"did": dId});
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var responseJson = jsonDecode(response.body);
    RubixLog().appendLog("Get Balance response from rubix: $responseJson");

    util.AccountInfoResponse allBalance =
        util.AccountInfoResponse.fromJson(responseJson);
    try {
      var currentAccountbalance = allBalance.accountInfo[0];
      int whole = currentAccountbalance.wholeRbt;
      int fraction = currentAccountbalance.partRbt;
      double wholeDouble = whole.toDouble();
      double fractionDouble = fraction.toDouble();
      double total = wholeDouble + fractionDouble;
      return GetBalanceRes(balance: total);
    } catch (e) {
      throw RubixException('could not find account info for did: $dId');
    }
  }

  Future<OnChainAsset> getAsset({required String did, required String peerId}) async {
    var url = Uri.http(rubixNodeBalancer.getRubixNode(peerId: peerId).url,
        '/api/get-data-token', {"did": did});
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var responseJson = jsonDecode(response.body);
    RubixLog().appendLog("Get Asset response from rubix: $responseJson");
    var status = responseJson['status'];
    if (status == false) {
      throw RubixException(responseJson['message']);
    }
    // get an array from a json
    var tokens = responseJson['tokens'];
    var tokenId = tokens['TokenID'];
    var didreceived = tokens['DID'];
    var committerDID = tokens['CommitterDID'];
    var batchID = tokens['BatchID'];
    var tokenStatus = tokens['TokenStatus'];
    return OnChainAsset(timsstamp: '',assetName: 'V-guard-poc',creatorName: 'Test',creatorDID: committerDID,price: '0',note: tokenId,status: tokenStatus,hash: batchID,chain: 'rubix',url: 'example.com');
  }
}
