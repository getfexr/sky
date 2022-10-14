import 'dart:math';

import 'package:cron/cron.dart';
import 'package:hive/hive.dart';

discardOTP() async {
  var codes = await Hive.openBox('codes');
  final cron = Cron();
  cron.schedule(Schedule.parse('5-7 * * * *'), () async {
    codes.deleteAt(-1);
  });
  codes.close();
}

Future<int> genOTP() async {
  var codes = await Hive.openBox('codes');
  // Generate random 4 digit number
  var rng = Random();
  var otp = rng.nextInt(9999);
  codes.put(otp, DateTime.now().toString());
  codes.close();
  discardOTP();
  return otp;
}

Future<bool> checkOTP(int otp) async {
  var codes = await Hive.openBox('codes');
  // Check if OTP is valid
  if (codes.containsKey(otp)) {
    codes.close();
    return true;
  } else {
    codes.close();
    return false;
  }
}
