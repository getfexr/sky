import 'package:sky/modules/utils.dart';

enum QRType {
  authentication,
}

extension QRTypeExtension on QRType {
  String get string {
    return "sky:external:${toString().split('.').last}";
  }
}

class QR {
  String data;
  DateTime expiresAt;
  QRType type;

  QR({required this.data, required this.expiresAt, required this.type});

  String getData() {
    return data;
  }

  bool isExpired() {
    return DateTimeV2.now().isAfter(expiresAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'expiresAt': expiresAt.toIso8601String(),
      'type': type.string,
    };
  }
}

class AuthenticationQR extends QR {
  AuthenticationQR({required String data, required DateTime expiresAt})
      : super(data: data, expiresAt: expiresAt, type: QRType.authentication);

  factory AuthenticationQR.forUuid(String uuid) {
    return AuthenticationQR(
        data: 'sky:ext:auth:$uuid',
        expiresAt: DateTimeV2.now().add(Duration(seconds: 30)));
  }

  String getUuid() {
    return data.split(':')[3];
  }
}
