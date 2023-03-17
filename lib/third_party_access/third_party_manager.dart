import 'package:sky/third_party_access/main.dart';

class ThirdPartyManager {
  static final ThirdPartyManager _instance = ThirdPartyManager._internal();
  factory ThirdPartyManager() {
    return _instance;
  }
  ThirdPartyManager._internal();

  final Map<String, ThirdPartyService> _registeredThirdPartyServices = {};

  void registerThirdPartyService(ThirdPartyService thirdPartyService) {
    _registeredThirdPartyServices[thirdPartyService.name] = thirdPartyService;
  }
}
