import 'package:hive/hive.dart';

void allSettings() async {
  var settings = await Hive.openBox('settings');
  for (var key in settings.keys) {
    print('$key : ${settings.get(key)}');
  }
  settings.close();
}

void addSettings(String key, String value) {
  var settings = Hive.box('settings');
  settings.put(key, value);
  settings.close();
  print('Added $key : $value');
}