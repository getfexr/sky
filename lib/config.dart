import 'package:dotenv/dotenv.dart';
var _env = DotEnv(includePlatformEnvironment: true)..load(['.env']);

class Config {
  static final Config _config = Config._internal();

  factory Config() {
    return _config;
  }

  Config._internal();

  int port = int.parse(_env['PORT'] ?? '6942');

  String get jwtAuthSecret {
    if (_env['JWT_AUTH_SECRET'] == null) {
      throw Exception('JWT_AUTH_SECRET not set');
    }
    return _env['JWT_AUTH_SECRET']!;
  }
}
