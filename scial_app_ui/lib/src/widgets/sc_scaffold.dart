import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar.dart';
import 'package:scial_app_ui/src/widgets/bottom_bar/sc_bottom_bar.dart';

class SCScaffold extends StatelessWidget {

  const SCScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomBar
  });

  final SCAppBar? appBar;
  final Widget? body;
  final SCBottomBar? bottomBar;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: theme.colors.background,
        systemNavigationBarIconBrightness: theme.colors.background == const Color(0xFFFFFFFF) // TODO Better way to check current theme mode
          ? Brightness.dark 
          : Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: theme.colors.background == const Color(0xFFFFFFFF) // TODO Better way to check current theme mode
          ? Brightness.light 
          : Brightness.dark,
        statusBarIconBrightness: theme.colors.background == const Color(0xFFFFFFFF) // TODO Better way to check current theme mode
          ? Brightness.dark 
          : Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: theme.colors.background,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomBar
      )
    );
  }
}