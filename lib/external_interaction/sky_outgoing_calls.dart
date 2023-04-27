import 'dart:convert';
import 'package:sky/config.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart';
import 'package:http/http.dart' as http;


Future<bool> fireAuthCallback({required String did,required String peerId,required String callBackUrl,required Token orgAccessToken,required String sessionId,required String chain })async {
  final skyUrl = Config().skyUrl;
    var bodyJsonStr = jsonEncode({
      'did': '$peerId.$did',
      'session_id': sessionId,
      'token': orgAccessToken.token,
      'chain': chain,
      'sky_url': skyUrl
    });
    print('call Back Url ---------$callBackUrl');
    print('bodyJsonStr ---------$bodyJsonStr');
  try{
     var response = await http.post(
      Uri.parse(callBackUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJsonStr,
    );
    var res1 = jsonDecode(response.body);
    print('res1 : $res1');
    print(response.toString());
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }catch(e, s){
    print(e);
    print(s);
    return false;
  }
}