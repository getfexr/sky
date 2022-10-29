import 'dart:convert';
import 'dart:math';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'modules/utils.dart' as utils;

class Bg {
  var lg = Logger(
    // filter:   LogFilter(),
    output: ConsoleOutput(),
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
class _OTP {
  final String value;
  final DateTime creationTime;

  static final int validityInMins = 5;

  _OTP(this.value, this.creationTime);

  factory _OTP.genOTP() {
    var rng = Random();
    var value = rng.nextInt(9999).toString().padLeft(4, '0');
    var creationTime = DateTime.now();
    return _OTP(value, creationTime);
  }

  factory _OTP.fromJSON(String jsonStr) {
    var json = jsonDecode(jsonStr);
    var value = json['value'];
    var creationTime = DateTime.parse(json['creationTime']);

    return _OTP(value, creationTime);
  }

  bool isValid() {
    var now = DateTime.now();
    var diff = now.difference(creationTime);
    return diff.inMinutes < validityInMins;
  }

  String toJSON() {
    return jsonEncode({
      'value': value,
      'creationTime': creationTime.toIso8601String(),
    });
  }
}

class OTPManager {
  static final OTPManager _otpManager = OTPManager._internal();
  factory OTPManager() {
    return _otpManager;
  }
  OTPManager._internal();

  Future<Box<dynamic>> openCodesBox() {
    return Hive.openBox('codes');
  }

  Future<bool> assertOTP(String otpInput) async {
    var box = await openCodesBox();
    var otpJsonStr = box.get(otpInput);
    box.close();

    if (otpJsonStr == null) {
      throw AssertionError('Invalid OTP');
    }

    var otp = _OTP.fromJSON(otpJsonStr);
    if (!otp.isValid()) {
      throw AssertionError('OTP expired');
    }

    return true;
  }

  generateNew() async {
    var box = await openCodesBox();
    var otp = _OTP.genOTP();

    print("OTP: ${otp.value} (Valid for ${_OTP.validityInMins} mins)");
    return box.put(otp.value, otp.toJSON());
  }

  Future<void> listOTPS() async {
    var box = await openCodesBox();
    var keys = box.keys;
    print("Listing OTPs ...");

    for (var i = 0; i < keys.length; i ++) {
      var key = keys.elementAt(i);
      var otpStr = box.get(key);
      var otp = _OTP.fromJSON(otpStr);
      var creationTime = otp.creationTime;
      var diff = utils.getRemainingTimeString(creationTime);

      var status = otp.isValid() ? 'Expires in $diff' : 'Expired $diff ago';
      var createdOn = 'Created on ${creationTime.toLocal()}';
      print('${(i + 1)}. OTP: ${otp.value} - $createdOn  - $status');
    }
    return box.close();
  }

  Future<void> deleteOTP(String otp) async {
    var box = await openCodesBox();
    return box.delete(otp);
  }
  // TODO: OTP - Auto cleanup of expired token
}

skyInfo() async {}

ipfsStats() {}
