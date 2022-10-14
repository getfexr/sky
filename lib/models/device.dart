import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Device {
  Device(
      {required this.pin,
      required this.ip,
      required this.address,
      required this.chain,
      required this.balance,
      required this.gateway,
      required this.timestamp});

  @HiveField(0)
  String pin;

  @HiveField(1)
  String ip;

  @HiveField(2)
  String address;

  @HiveField(3)
  String chain;

  @HiveField(4)
  String balance;

  @HiveField(5)
  String gateway;

   @HiveField(5)
  DateTime timestamp;

  @override
  String toString() {
    return '$chain: $address';
  }
}

// hive adapter for Wallet class
class DeviceAdapter extends TypeAdapter<Device> {
  @override
  int get typeId => 2;

  @override
  Device read(BinaryReader reader) {
    var numFields = reader.readByte();
    var fields = <dynamic>[];
    for (var i = 0; i < numFields; i++) {
      fields.add(reader.read());
    }
    return Device(
        pin: fields[0] as String,
        ip: fields[1] as String,
        address: fields[2] as String,
        chain: fields[0] as String,
        balance: fields[1] as String,
        gateway: fields[2] as String,
        timestamp: fields[2] as DateTime);
  }

  @override
  void write(BinaryWriter writer, Device obj) {
    writer.writeByte(6);
    writer.write(obj.pin);
    writer.write(obj.ip);
    writer.write(obj.address);
    writer.write(obj.chain);
    writer.write(obj.balance);
    writer.write(obj.gateway);
    writer.write(obj.timestamp);
  }
}
