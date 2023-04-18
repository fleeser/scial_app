import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class MainBuilder extends StatelessWidget {

  const MainBuilder({ 
    super.key,
    required this.location,
    required this.child
  });

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SCScaffold(
      body: child,
      bottomNavigationBar: SCBottomBar(
        items: [
          SCBottomBarItem(
            onPressed: () => context.navigateToHomePage(),
            icon: SCIcons.home,
            selected: location == AppRoute.home.path
          ),
          SCBottomBarItem(
            onPressed: () => context.navigateToDiscoverPage(),
            icon: SCIcons.search,
            selected: location == AppRoute.discover.path
          ),
          SCBottomBarItem(
            onPressed: () {},
            icon: SCIcons.plus,
            isAction: true
          ),
          SCBottomBarItem(
            onPressed: () => context.navigateToNotificationsPage(),
            icon: SCIcons.bell,
            selected: location == AppRoute.notifications.path
          ),
          SCBottomBarItem(
            onPressed: () => context.navigateToProfilePage(),
            icon: SCIcons.user,
            selected: location == AppRoute.profile.path
          )
        ]
      )
    );
  }
}