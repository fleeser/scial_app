import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum Boxes {
  auth('auth'),
  theme('theme'),
  localization('localization');

  const Boxes(this.title);

  final String title;
}

enum AuthBoxKeys {

  key('key'),
  userId('userId');

  const AuthBoxKeys(this.title);

  final String title;
}

enum ThemeBoxKeys {

  mode('mode');

  const ThemeBoxKeys(this.title);

  final String title;
}

enum LocalizationBoxKeys {

  language('language'),
  country('country');

  const LocalizationBoxKeys(this.title);

  final String title;
}

class KeyValueStorage {

  static final Box _authBox = Hive.box(Boxes.auth.title);
  static final Box _themeBox = Hive.box(Boxes.theme.title);
  static final Box _localizationBox = Hive.box(Boxes.localization.title);

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
    await _authBox.put(AuthBoxKeys.key.title, '$keyId:$key');
    await _authBox.put(AuthBoxKeys.userId.title, userId);
  }

  static Future<void> removeAuthInfo() async {
    await _authBox.delete(AuthBoxKeys.key.title);
    await _authBox.delete(AuthBoxKeys.userId.title);
  }

  static Future<void> openThemeBox() async {
    await Hive.openBox(Boxes.theme.title);
  }

  static Future<void> closeThemeBox() async {
    return await _themeBox.close();
  }

  static int? getThemeMode() {
    return _themeBox.get(ThemeBoxKeys.mode.title);
  }

  static Future<void> putThemeMode(int mode) async {
    return await _themeBox.put(ThemeBoxKeys.mode.title, mode);
  }

  static Future<void> openLocalizationBox() async {
    await Hive.openBox(Boxes.localization.title);
  }

  static Future<void> closeLocalizationBox() async {
    return await _localizationBox.close();
  }

  static Locale? getLocale() {
    String? language = _localizationBox.get(LocalizationBoxKeys.language.title);
    String? country = _localizationBox.get(LocalizationBoxKeys.country.title);

    if (language == null) return null;

    return Locale(language, country);
  }

  static Future<void> putLocale(Locale locale) async {
    await _localizationBox.put(LocalizationBoxKeys.language, locale.languageCode);
    await _localizationBox.put(LocalizationBoxKeys.country, locale.countryCode);
  }
}