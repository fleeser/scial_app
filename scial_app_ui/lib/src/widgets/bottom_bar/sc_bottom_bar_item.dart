import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';

class SCBottomBarItem {

  const SCBottomBarItem({
    this.icon,
    this.primary = false
  });

  const SCBottomBarItem.primary({
    this.icon
  })
  : primary = true;

  const SCBottomBarItem.secondary({
    this.icon
  })
  : primary = false;

  final SCIcons? icon;
  final bool primary;
}

class SCBottomBarItemWidget extends StatelessWidget {

  const SCBottomBarItemWidget({
    super.key,
    this.icon,
    this.isSelected = false,
    this.onPressed,
    this.primary = false
  });

  final SCIcons? icon;
  final bool isSelected;
  final void Function()? onPressed;
  final bool primary;

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
        fillColor: primary
          ? theme.colors.bottomBarPrimaryBackground
          : null,
        child: icon != null
          ? SCIcon(
            icon: icon!,
            size: (kBottomNavigationBarHeight - 10.0) / 2.0,
            color: primary
              ? theme.colors.bottomBarPrimaryForeground
              : isSelected
                ? theme.colors.bottomBarSecondarySelectedForeground
                : theme.colors.bottomBarSecondaryUnselectedForeground
          )
          : null
      )
    );
  }
}