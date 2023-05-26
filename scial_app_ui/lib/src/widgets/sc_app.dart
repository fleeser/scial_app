import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:scial_app_ui/src/theme/sc_responsive_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_color_mode.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

class SCApp extends StatelessWidget {

  const SCApp({
    super.key,
    required this.colorMode,
    required this.routerConfig,
    required this.supportedLocales,
    required this.localizationsDelegates,
    required this.locale,
    this.debugShowCheckedModeBanner = false
  });

  final bool debugShowCheckedModeBanner;
  final SCThemeColorMode colorMode;
  final RouterConfig<Object> routerConfig;
  final List<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return SCResponsiveTheme(
      colorMode: colorMode, 
      child: cupertino.Builder(builder: (context) {

        final SCThemeData theme = SCTheme.of(context);

        return WidgetsApp.router(
          key: GlobalObjectKey(this),
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          routerConfig: routerConfig,
          supportedLocales: supportedLocales,
          localizationsDelegates: localizationsDelegates,
          locale: locale,
          color: theme.colors.accent
        );
      })
    );
  }
}