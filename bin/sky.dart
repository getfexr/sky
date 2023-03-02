import 'dart:io';

import 'package:hive/hive.dart';
import 'package:sky/background.dart';
import 'package:sky/config.dart';
import 'package:sky/settings.dart';
import 'package:sky/sky.dart';

Future<void> main(List<String> arguments) async {
  Hive.init('sky-data');

  var keepRunning = false;

  if (arguments.isEmpty) {
    showHelp();
  } else {
    switch (arguments[0]) {
      case "club":
        print('Opening Club web page in browser ...');
        break;
      case "otp":
        switch (arguments[1]) {
          case "new":
            await OTPManager().generateNew();
            break;
          case "list":
            await OTPManager().listOTPS();
            break;
          default:
            print('Invalid OTP command');
        }
        break;
      case "start":
        List<String> flags = arguments.sublist(1);
        if (flags.contains('--debug')) {
          print("Debug mode enabled");
          Config().debugLog = true;
        }
        startRPCDaemon();
        keepRunning = true;
        break;
      case "settings":
        switch (arguments[1]) {
          case "list":
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
        // TODO: implement shutdown
        break;
      case "list":
        //  TODO
        break;
      case "logs":
        // TODO
        break;
      case "version":
        // TODO
        break;
      case "find":
        //  TODO
        break;
      case "help":
        showHelp();
        break;
      default:
        print("Invalid argument");
    }

    if (!keepRunning) {
      exit(0);
    }
  }
}

void showHelp() {
  print('\nFexr Sky CLI Help\n');
  print('Usage: sky otp [new|list] - Generate new OTP or list all OTPs');
  print('Usage: sky start - Start the Fexr Sky server');
  print('Usage: sky update - Update the Fexr Sky to the latest version');
  print('Usage: sky shutdown - Shutdown the Fexr Sky server');
  print('Usage: sky list - List all running Fexr Sky user addresses');
  print('Usage: sky logs - View the logs of the Fexr Sky activities');
  print('Usage: sky version - View the version of the Fexr Sky');
  print('Usage: sky find - Find the Fexr Sky users using address');
  print('Usage: sky help - View the help menu');
}
