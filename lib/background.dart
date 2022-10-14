import 'dart:math';

import 'package:cron/cron.dart';
import 'package:hive/hive.dart';

class Bg {
  var codes = Hive.box('codes');

  discardOTP() async {
    final cron = Cron();
    cron.schedule(Schedule.parse('5-7 * * * *'), () async {
      codes.deleteAt(-1);
    });
  }

  Future<int> genOTP() async {
    // Generate random 4 digit number
    var rng = Random();
    var otp = rng.nextInt(9999);
    codes.put(otp, DateTime.now);
    discardOTP();
    return otp;
  }

  Future<bool> checkOTP(int otp) async {
    // Check if OTP is valid
    if (codes.containsKey(otp)) {
      return true;
    } else {
      return false;
    }
  }
}
