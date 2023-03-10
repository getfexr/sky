import 'package:hive/hive.dart';
import 'package:sky/modules/hive/hive_boxes.dart';

Future<Box<E>> openBox<E>(HiveBox box) async {
  return Hive.openBox<E>(box.toString());
}

void initHive() {
  Hive.init('sky-data');
}
