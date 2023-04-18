import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

class SCTheme extends InheritedWidget {

  const SCTheme({
    super.key,
    required this.data,
    required Widget child
  }) : super(child: child);

  final SCThemeData data;

  static SCThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SCTheme>()!.data;
  }

  @override
  bool updateShouldNotify(covariant SCTheme oldWidget) {
    return data != oldWidget.data;
  }
}