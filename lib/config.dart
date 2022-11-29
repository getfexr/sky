import 'package:dotenv/dotenv.dart';
var _env = DotEnv(includePlatformEnvironment: true)..load(['.env']);

String _jwtSecret() {
  var secret = _env['JWT_AUTH_SECRET'];
  if (secret == null) {
    throw Exception('.env: JWT_AUTH_SECRET not set');
  }

  if (secret.length < 32) {
    throw Exception('.env: JWT_AUTH_SECRET must be at least 32 characters long');
  }
  return secret;
}

String _rubixQuorumKeyPass() {
  var pass = _env['RUBIX_QUORUM_KEY_PASS'];
  if (pass == null) {
    throw Exception('.env: RUBIX_QUORUM_KEY_PASS not set');
  }
  return pass;
}

class Config {
  static final Config _config = Config._internal();
  factory Config() {
    return _config;
  }

  Config._internal();

  int port = int.parse(_env['PORT'] ?? '6942');
  String jwtAuthSecret = _jwtSecret();

  bool debugLog = false; // set via --debug flag

  // Rubix
  String rubixEndpoint = _env['RUBIX_ENDPOINT'] ?? 'localhost:1898';

  String rubixPrivateKeyPass = _env['RUBIX_PRIVATE_KEY_PASS'] ?? '';
  // Optional as this shall be passed from client as well

  String rubixQuorumKeyPass = _rubixQuorumKeyPass();
}
