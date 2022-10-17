import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';
import 'package:sky/protogen/google/protobuf/timestamp.pb.dart';
import 'package:sky/protogen/sky.pb.dart';
import 'package:sky/background.dart';

checkAddressIfHosted(String address) async {
  Bg().lg.i('checkAddressOwnership: $address');
  // check if hive db 'oracle' has address as its key

  var settings = await Hive.openBox('oracle');
  if (settings.containsKey(address)) {
    return true;
  }
  settings.close();

  throw GrpcError.unavailable('$address is not hosted on Sky');
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

validateExpiry(Timestamp expiryAt, int expiryIn) {
  Bg().lg.i('validateExpiry: $expiryAt, $expiryIn');
  // validate the expiry time to be more than atleast 5 minutes
  // validate the expiry time to be less than 24 hours

  // throw UnimplementedError();
}

Future<String> genCharecterGroupChallenge(String purposeMessage,
    ChallengeReq_purposeType purpose, String permission) {
  Bg()
      .lg
      .e('genCharecterGroupChallenge: $purposeMessage, $purpose, $permission');
  return Future.value('0');
  // throw UnimplementedError();
}
