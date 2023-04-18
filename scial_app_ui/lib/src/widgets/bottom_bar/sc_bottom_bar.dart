import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/bottom_bar/sc_bottom_bar_item.dart';

class SCBottomBar extends StatelessWidget {
  
  const SCBottomBar({
    super.key,
    required this.items
  });

  final List<SCBottomBarItem> items;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).padding.bottom + kBottomNavigationBarHeight,
      color: theme.colors.bottomBarBackground,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (int index) => items[index])
      )
    );
  }
}