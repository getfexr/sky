import 'dart:math';

import 'package:cron/cron.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class Bg {
  var lg = Logger(
    // filter:   LogFilter(),
    output:  ConsoleOutput(),
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true // Should each log print contain a timestamp
        ),
  );
  dump() {
    lg.toString();
  }
}

discardOTP() async {
  var codes = await Hive.openBox('codes');
  final cron = Cron();
  cron.schedule(Schedule.parse('5-7 * * * *'), () async {
    codes.deleteAt(-1);
  });
  codes.close();
}

listOTP() async {
  var codes = await Hive.openBox('codes');
  // print codes and time stamps in reverse order with index human readable dates
  for (var i = codes.length - 1; i >= 0; i--) {
    print(
        '${i+1}th code is ${codes.keyAt(i)} created on ${DateTime.fromMillisecondsSinceEpoch(codes.keyAt(i)).toLocal()}');
  }
  codes.close();
}

skyInfo() async {
}

genOTP() async {
  var codes = await Hive.openBox('codes');
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
