import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet.dart';
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
      bottomBar: SCBottomBar(
        selectedIndex: _selectedIndex,
        onPressed: (int index) => _onPressed(context, index),
        items: const [
          SCBottomBarItem.secondary(icon: SCIcons.home),
          SCBottomBarItem.secondary(icon: SCIcons.search),
          SCBottomBarItem.primary(icon: SCIcons.plus),
          SCBottomBarItem.secondary(icon: SCIcons.bell),
          SCBottomBarItem.secondary(icon: SCIcons.user)
        ]
      )
    );
  }

  int get _selectedIndex {
    switch (location) {
      case '/home': return 0;
      case '/discover': return 1;
      case '/notifications': return 3;
      default: return 4;
    }
  }

  void _onPressed(BuildContext context, int index) async {
    switch (index) {
      case 0: 
        context.navigateToHomePage();
        break;
      case 1:
        context.navigateToDiscoverPage();
        break;
      case 2:
        await showCreateEventSheet(context);
        break;
      case 3:
        context.navigateToNotificationsPage();
        break;
      default:
        context.navigateToProfilePage();
        break;
    }
  }
}