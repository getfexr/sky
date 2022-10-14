import 'package:hive/hive.dart';
import 'package:sky/background.dart';
import 'package:sky/models/nativeInteraction.dart';
import 'package:sky/models/otp.dart';
import 'package:sky/sky.dart';

Future<void> main(List<String> arguments) async {

  Hive.init('sky-data');
  Hive.registerAdapter<NativeInteraction>(NativeInteractionAdapter());
  Hive.registerAdapter<OTP>(OTPAdapter());
  // await Hive.openBox('nativeInteraction');

  switch (arguments[0]) {
    case "club":
      print('Opening Club web page in browser ...');
      break;
    case "otp":
      genOTP().then((int otp) {
        print('OTP valid for 5 mins: $otp');
      });
      break;
    case "start":
      startRPCDaemon();
      break;
    case "update":
      genOTP().then((int otp) {
        print('OTP valid for 5 mins: $otp');
      });
      break;
    case "shutdown":
      genOTP().then((int otp) {
        print('OTP valid for 5 mins: $otp');
      });
      break;
    case "list":
      genOTP().then((int otp) {
        print('OTP valid for 5 mins: $otp');
      });
      break;
    case "logs":
      genOTP().then((int otp) {
        print('OTP valid for 5 mins: $otp');
      });
      break;
    case "version":
      genOTP().then((int otp) {
        print('OTP valid for 5 mins: $otp');
      });
      break;
    case "find":
      genOTP().then((int otp) {
        print('OTP valid for 5 mins: $otp');
      });
      break;
    case "help":
      print('\nFexr Sky CLI Help\n');
      print('Usage: sky otp - Generate a new OTP');
      print('Usage: sky start - Start the Fexr Sky server');
      print('Usage: sky update - Update the Fexr Sky to the latest version');
      print('Usage: sky shutdown - Shutdown the Fexr Sky server');
      print('Usage: sky list - List all running Fexr Sky user addresses');
      print('Usage: sky logs - View the logs of the Fexr Sky activities');
      print('Usage: sky version - View the version of the Fexr Sky');
      print('Usage: sky find - Find the Fexr Sky users using address');
      print('Usage: sky help - View the help menu');
      break;
    default:
      print("Invalid argument");
  }
}
