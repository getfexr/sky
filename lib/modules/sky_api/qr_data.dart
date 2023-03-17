enum QRType { externalLogin }

class QRData {
  String data;
  DateTime expiry;
  QRType type;

  QRData(this.data, this.expiry, this.type);

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'expiry': expiry.toIso8601String(),
      'type': type.toString(),
    };
  }
}
