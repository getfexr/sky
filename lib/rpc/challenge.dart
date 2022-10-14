import 'package:sky/protogen/google/protobuf/timestamp.pb.dart';
import 'package:sky/protogen/sky.pb.dart';
import 'package:sky/background.dart';

checkAddressOwnership(String address) {
  Bg().lg.i('checkAddressOwnership: $address');
  // check if the address is hosted in one of the Fexr partnered subnets
  // throw UnimplementedError();

}

validateExpiry(Timestamp expiryAt, int expiryIn) {
  Bg().lg.i('validateExpiry: $expiryAt, $expiryIn');
  // validate the expiry time to be more than atleast 5 minutes
  // validate the expiry time to be less than 24 hours

  // throw UnimplementedError();
}

Future<String> genCharecterGroupChallenge(String purposeMessage, ChallengeReq_purposeType purpose, String permission) {
  Bg().lg.e('genCharecterGroupChallenge: $purposeMessage, $purpose, $permission');
  return Future.value('0');
  // throw UnimplementedError();
}

logChallenge(ChallengeReq request) {
  Bg().lg.i('logChallenge: $request');
  Bg().dump();
  // log challenge request to the log file


  // throw UnimplementedError();
}
