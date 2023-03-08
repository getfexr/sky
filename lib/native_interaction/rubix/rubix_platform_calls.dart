import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sky/config.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart' as util;
import 'package:sky/protogen/google/protobuf/timestamp.pb.dart';
import 'package:sky/modules/utils.dart';
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
  }
}

class RubixInstance {
  String peerId;
  int port;
  String url;
  RubixInstance(this.peerId, this.port, this.url);
}

class RubixNodeBalancer {
  RubixNodeBalancer._internal();
  static final RubixNodeBalancer _instance = RubixNodeBalancer._internal();
  factory RubixNodeBalancer() {
    return _instance;
  }

  final BiMap<String, int> rubixPeerIdPortMap =
      BiMap.fromMap(Config().rubixPeerIdPortMap);
  int _currentPortIndex = 0;
  // Circularly iterate through the ports
  String getNextPeerId() {
    var peerIds = rubixPeerIdPortMap.keys.toList();
    var peerId = peerIds[_currentPortIndex];
    _currentPortIndex = (_currentPortIndex + 1) % peerIds.length;
    return peerId;
  }

  RubixInstance getRubixNode({String? peerId}) {
    try {
      String sPeerId;
      if (peerId == null) {
        // For new create DID requests, we will use the next peerId
        sPeerId = getNextPeerId();
      } else {
        sPeerId = peerId;
      }
      var port = rubixPeerIdPortMap[sPeerId];
      return RubixInstance(sPeerId, port, '127.0.0.1:$port');
    } catch (e) {
      throw RubixException('Invalid peerId');
    }
  }
}

class RubixPlatform {
  static final RubixPlatform _rubixPlatform = RubixPlatform._internal();
  factory RubixPlatform() {
    return _rubixPlatform;
  }

   Future<GetBalanceRes> getBalance(
      {required String dId, required String peerId}) async {

    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'did': dId
    });
    RubixLog().appendLog("signResponse request to rubix: $bodyJsonStr");
    var response = await http.post(
      Uri.http(RubixNodeBalancer().getRubixNode(peerId: peerId).url,
          '/api/get-account-info'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );
    var responseJson = jsonDecode(response.body);
    var whole = responseJson['account_info']['wholeRbt'];
    var fraction = responseJson['account_info']['partRbt'];
    if (whole != null && fraction != null) {
      return GetBalanceRes(
          balance: int.parse(whole) + double.parse(fraction));
    } else {
      RubixLog().appendLog("get balance failed");
      throw RubixException("get balance failed");
    }
  }

  RubixPlatform._internal();

  Future<CreateDIDRes> createDID(
      {required String didImgFile,
      required String pubImgFile,
      required String pubKey}) async {
    const didFileName = 'did.png';
    const pubShareFileName = 'pubShare.png';
    const pubKeyFileName = 'pubKey.pem';

    var rubixNode = RubixNodeBalancer().getRubixNode();
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
      Uri.http(RubixNodeBalancer().getRubixNode(peerId: peerId).url,
          '/api/initiate-rbt-transfer'),
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
        requestId: requestId, hash: hashForSign);
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
      Uri.http(RubixNodeBalancer().getRubixNode(peerId: peerId).url,
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
      Uri.http(RubixNodeBalancer().getRubixNode(peerId: peerId).url,
          '/api/signature-response'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );
    var responseJson = jsonDecode(response.body);
    var status = responseJson['status'];
    return Status(status: status);
  }
}
