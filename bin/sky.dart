import 'package:hive/hive.dart';
import 'package:sky/background.dart';
import 'package:sky/models/native_interaction.dart';
import 'package:sky/models/oracle.dart';
import 'package:sky/settings.dart';
import 'package:sky/sky.dart';

Future<void> main(List<String> arguments) async {
  Hive.init('sky-data');
  Hive.registerAdapter<NativeInteraction>(NativeInteractionAdapter());
  Hive.registerAdapter<Oracle>(OracleAdapter());

  switch (arguments[0]) {
    case "club":
      print('Opening Club web page in browser ...');
      break;
    case "otp":
      switch (arguments[1]) {
        case "gen":
          print('\nGenerating OTP ...');
          print(await genOTP());
          print('OTP is valid for 5 minutes.\n');
          break;
        case "check":
          print('\nChecking OTP ...');
          print(await checkOTP(int.parse(arguments[2]))
              ? 'OTP is valid'
              : 'OTP is invalid');
          break;
        case "list":
          print('Listing OTPs ...');
          await listOTP();
          break;
        default:
          print('Invalid OTP command');
      }
      break;
    case "start":
      startRPCDaemon();
      break;
    case "settings":
      switch (arguments[1]) {
        case "all":
          print('Listing all settings ...');
          allSettings();
          break;
        case "add":
          print('Adding settings ...');
          addSettings(arguments[2], arguments[3]);
          break;
        default:
          print('Invalid settings command');
      }
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
