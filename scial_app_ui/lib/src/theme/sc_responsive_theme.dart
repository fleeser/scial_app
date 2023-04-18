import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/data/sc_colors_data.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_color_mode.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

class SCResponsiveTheme extends StatelessWidget {

  const SCResponsiveTheme({
    super.key,
    required this.colorMode,
    required this.child
  });

  final SCThemeColorMode colorMode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    SCThemeData theme = SCThemeData.regular();

    switch (colorMode) {
      case SCThemeColorMode.light:
        theme = theme.withColors(SCColorsData.light());
        break;
      case SCThemeColorMode.dark:
        theme = theme.withColors(SCColorsData.dark());
        break;
    }

    return SCTheme(
      data: theme, 
      child: child
    );
  }
}