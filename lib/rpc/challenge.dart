import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';
import 'package:sky/protogen/google/protobuf/timestamp.pb.dart';
import 'package:sky/protogen/sky.pb.dart';
import 'package:sky/background.dart';

Future<bool> checkAddressIfHosted(String address) async {
  Bg().lg.i('checkAddressOwnership: $address');
  var settings = await Hive.openBox('oracle');
  if (settings.containsKey(address)) {
    return true;
  }
  settings.close();

  return false;
}

bool checkAuthLink(String link) {
  Bg().lg.i('check auth link: $link');
  bool validURL = Uri.parse(link).isAbsolute;
  if (validURL) {
    return true;
  }
  throw GrpcError.unavailable('Invalid auth link');
}

Future<ChallengeRes> notifyUser(ChallengeReq request, String challenge) async {
  // start counting expiryIn seconds
  Bg().lg.i('notifyUser: $request');
  String signedMessage = '';
  // while (
  //     request.expiryIn > (currentSecond - startSecond) || signedMessage == '') {
  //   // call relay from sky.dart
  //   relay();
  // }
  return Future.value(ChallengeRes(
      challengePayload: challenge,
      ok: true,
      message: 'Success. Address owner will be notified soon..'));
  // notify the user that a challenge is pending
}

bool validateExpiry(Timestamp expiryAt, int expiryIn) {
  Bg().lg.i('validateExpiry: $expiryAt, $expiryIn');
  if (expiryIn > 300) {
    return true;
  } else {
    return false;
  }
}

Future<String> genCharecterGroupChallenge(String purposeMessage,
    ChallengeReq_purposeType purpose, String permission) {
  Bg()
      .lg
      .e('genCharecterGroupChallenge: $purposeMessage, $purpose, $permission');

  // new string buffer to store the result
  StringBuffer sb = StringBuffer();
  int prefix = ChallengeReq_purposeType.values.indexOf(purpose);
  sb.write(prefix);
  // create MD5 Hash of perposeMessage
  String hash = md5.convert(utf8.encode(purposeMessage)).toString();
  sb.write(hash.substring(0, 4));
  return Future.value(sb.toString());
}
