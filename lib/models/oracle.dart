import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Oracle {
  Oracle(
      {required this.address,
      required this.chain,
      required this.peerId,
      required this.timestamp});

  @HiveField(0)
  String address;

  @HiveField(1)
  String chain;

  @HiveField(2)
  String peerId;

   @HiveField(3)
  DateTime timestamp;

  @override
  String toString() {
    return '$chain: $address';
  }
}

// hive adapter for Wallet class
class OracleAdapter extends TypeAdapter<Oracle> {
  @override
  int get typeId => 2;

  @override
  Oracle read(BinaryReader reader) {
    var numFields = reader.readByte();
    var fields = <dynamic>[];
    for (var i = 0; i < numFields; i++) {
      fields.add(reader.read());
    }
    return Oracle(
        address: fields[0] as String,
        chain: fields[1] as String,
        peerId: fields[2] as String,
        timestamp: fields[2] as DateTime);
  }

  @override
  void write(BinaryWriter writer, Oracle obj) {
    writer.writeByte(4);
    writer.write(obj.address);
    writer.write(obj.chain);
    writer.write(obj.peerId);
    writer.write(obj.timestamp);
  }
}
