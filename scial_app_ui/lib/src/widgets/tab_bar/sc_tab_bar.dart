import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCTabBar extends StatelessWidget implements PreferredSizeWidget {

  const SCTabBar({
    super.key,
    this.controller,
    this.titles = const <String>[]
  });

  final TabController? controller;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Container(
      width: preferredSize.width,
      height: preferredSize.height,
      color: theme.colors.tabBarBackground,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        padding: const SCEdgeInsets.symmetric(
          horizontal: SCGapSize.semiBig,
          vertical: SCGapSize.regular
        ).toEdgeInsets(theme),
        labelPadding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig).toEdgeInsets(theme),
        indicator: BoxDecoration(
          color: theme.colors.tabBarSelectedBackground,
          borderRadius: BorderRadius.circular(19.0)
        ),
        labelColor: theme.colors.tabBarSelectedForeground,
        unselectedLabelColor: theme.colors.tabBarUnselectedForeground,
        labelStyle: theme.typography.tabBarSelectedTitle,
        unselectedLabelStyle: theme.typography.tabBarUnselectedTitle,
        tabs: titles.map((String title) => Tab(text: title)).toList()
      )
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 62.0);
}