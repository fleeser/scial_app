import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum Boxes {
  auth('auth');

  const Boxes(this.title);

  final String title;
}

enum AuthBoxKeys {

  key('key'),
  userId('userId');

  const AuthBoxKeys(this.title);

  final String title;
}

class KeyValueStorage {

  static final Box _authBox = Hive.box(Boxes.auth.title);

  static Future<void> openAuthBox() async {
    await Hive.openBox(Boxes.auth.title);
  }

  static Future<void> closeAuthBox() async {
    return await _authBox.close();
  }

  static String? getAuthKey() {
    return _authBox.get(AuthBoxKeys.key.title);
  }

  static Future<void> putAuthKey(String key) async {
    return await _authBox.put(AuthBoxKeys.key.title, key);
  }

  static Future<void> removeAuthKey() async {
    return await _authBox.delete(AuthBoxKeys.key.title);
  }

  static int? getUserId() {
    return _authBox.get(AuthBoxKeys.userId.title);
  }

  static bool get isAuthenticated => getAuthKey() != null;

  static ValueListenable get authState {
    return _authBox.listenable(keys: [ AuthBoxKeys.userId.title ]);
  }

  static Future<void> storeAuthInfo(int keyId, String key, int userId) async {
    await _authBox.put(AuthBoxKeys.key.title, key);
    await _authBox.put(AuthBoxKeys.userId.title, userId);
  }

  static Future<void> removeAuthInfo() async {
    await _authBox.delete(AuthBoxKeys.key.title);
    await _authBox.delete(AuthBoxKeys.userId.title);
  }
}