import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sky/config.dart';
import 'package:sky/modules/jwt.dart';
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

class RubixUtil {
  Future<ChallengeString> createDIDChallenge({required String publicKey}) {
    final challengeToken = ChallengeToken.get(publicKey: publicKey);
    return Future.value(ChallengeString(
      challenge: challengeToken.token,
    ));
  }
}

class RubixPlatform {
  static final RubixPlatform _rubixPlatform = RubixPlatform._internal();
  factory RubixPlatform() {
    return _rubixPlatform;
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

  RubixPlatform._internal();

  final String _url = Config().rubixEndpoint;

  Future<CreateDIDRes> createDID(
      {required String didImgFile,
      required String pubImgFile,
      required String pubKeyFile}) async {
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
    request.files.add(http.MultipartFile.fromBytes(
        'did_image', base64.decode(didImgFile),
        filename: didFileName));
    request.files.add(http.MultipartFile.fromBytes(
        'pub_image', base64.decode(pubImgFile),
        filename: pubShareFileName));
    request.files.add(http.MultipartFile.fromString('pub_key', pubKeyFile,
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
      result = '$peerId.$did';
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
        requestId: requestId, hash: hashForSign);
  }

  Future<RequestTransactionPayloadRes> generateTestRbt(
      {required String did, required double tokenCount}) async {
    var bodyJsonStr = jsonEncode(<String, dynamic>{
      'number_of_tokens': tokenCount.ceil(),
      'did': did,
    });

    RubixLog().appendLog("generateTestRbt request to rubix: $bodyJsonStr");

    var response = await http.post(
      Uri.http(_url, '/api/generate-test-token'),
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

  Future<Status> signResponse({required HashSigned request}) async {
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
      Uri.http(_url, '/api/signature-response'),
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
