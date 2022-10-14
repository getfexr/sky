import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class NativeInteraction {
  NativeInteraction(
      {required this.chain,
      required this.abbr,
      required this.address,
      required this.name,
      required this.balance,
      required this.gateway});

  @HiveField(0)
  String chain;

  @HiveField(1)
  String abbr;

  @HiveField(2)
  String address;

  @HiveField(3)
  String name;

  @HiveField(4)
  String balance;

  @HiveField(5)
  String gateway;

  @override
  String toString() {
    return '$name: $address';
  }
}

// hive adapter for Wallet class
class NativeInteractionAdapter extends TypeAdapter<NativeInteraction> {
  @override
  int get typeId => 1;

  @override
  NativeInteraction read(BinaryReader reader) {
    var numFields = reader.readByte();
    var fields = <dynamic>[];
    for (var i = 0; i < numFields; i++) {
      fields.add(reader.read());
    }
    return NativeInteraction(
        chain: fields[0] as String,
        abbr: fields[1] as String,
        address: fields[2] as String,
        name: fields[0] as String,
        balance: fields[1] as String,
        gateway: fields[2] as String);
  }

  @override
  void write(BinaryWriter writer, NativeInteraction obj) {
    writer.writeByte(6);
    writer.write(obj.chain);
    writer.write(obj.abbr);
    writer.write(obj.address);
    writer.write(obj.name);
    writer.write(obj.balance);
    writer.write(obj.gateway);
  }
}
