import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';

class AuthKeyManager extends AuthenticationKeyManager {

  @override
  Future<String?> get() {
    return Future.value(KeyValueStorage.getAuthKey());
  }

  @override
  Future<void> put(String key) async {
    return await KeyValueStorage.putAuthKey(key);
  }

  @override
  Future<void> remove() async {
    return await KeyValueStorage.removeAuthKey();
  }
}