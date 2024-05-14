import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:impossible_flutter/app/core/core.dart';

class TokenManager extends GetxController {
  static TokenManager get of => Get.isRegistered<TokenManager>()
      ? Get.find<TokenManager>()
      : Get.put(TokenManager());

  late final FlutterSecureStorage _storage;

  TokenManager() {
    _storage = const FlutterSecureStorage();
  }

  // token manager

  getAccessToken() async => await _storage.read(
        key: ACCESS_TOKEN_KEY,
      );

  getRefreshToken() async => await _storage.read(
        key: REFRESH_TOKEN_KEY,
      );

  updateAccessToken(String acToken) async {
    await _storage.write(key: ACCESS_TOKEN_KEY, value: acToken);
  }

  updateRefreshToken(String rfToken) async {
    await _storage.write(key: REFRESH_TOKEN_KEY, value: rfToken);
  }

  clear() async {
    await _storage.delete(key: ACCESS_TOKEN_KEY);
    await _storage.delete(key: REFRESH_TOKEN_KEY);
  }
}
