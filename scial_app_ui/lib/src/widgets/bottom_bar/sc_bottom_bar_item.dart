import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';

class SCBottomBarItem extends StatelessWidget {

  const SCBottomBarItem({
    super.key,
    this.onPressed,
    required this.icon,
    this.isAction = false,
    this.selected = false
  });

  final void Function()? onPressed;
  final SCIcons icon;
  final bool isAction;
  final bool selected;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      width: kBottomNavigationBarHeight - 10.0,
      height: kBottomNavigationBarHeight - 10.0,
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((kBottomNavigationBarHeight - 10.0) / 2.0)),
        fillColor: isAction
          ? theme.colors.bottomBarActionBackground
          : null,
        child: SCIcon(
          icon: icon,
          size: (kBottomNavigationBarHeight - 10.0) / 2.0,
          color: isAction
            ? theme.colors.bottomBarActionForeground
            : selected
              ? theme.colors.bottomBarSelectedForeground
              : theme.colors.bottomBarUnselectedForeground
        )
      ),
    );
  }
}