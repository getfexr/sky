import 'package:hive/hive.dart';

void allSettings() async {
  var settings = await Hive.openBox('settings');
  for (var key in settings.keys) {
    print('$key : ${settings.get(key)}');
  }
  settings.close();
}

void addSettings(String key, String value) async {
  var settings = await Hive.openBox('settings');
  settings.put(key, value);
  settings.close();
  print('Added $key : $value');
}

// void triggerNativeInteraction(String key) async {
//   var settings = await Hive.openBox('settings');
//   var nativeInteraction = NativeInteraction(
//       key: key,
//       value: settings.get(key),
//       timestamp: DateTime.now().millisecondsSinceEpoch);
//   var nativeInteractions = await Hive.openBox('nativeInteractions');
//   nativeInteractions.add(nativeInteraction);
//   nativeInteractions.close();
//   settings.close();
//   print('Triggered $key : ${nativeInteraction.value}');
// }