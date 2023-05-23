import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {

  @override
  FutureOr<void> build() async { }

  void handleChangeTheme(BuildContext context) {
    context.navigateToChangeThemePage();
  }

  void handleChangeLanguage(BuildContext context) {
    context.navigateToChangeLanguagePage();
  }
}