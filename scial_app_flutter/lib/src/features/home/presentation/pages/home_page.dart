import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/features/scial_day/presentation/widgets/scial_day_cta.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.home_app_bar_title),
        actionButtons: _actionButtons(context),
      ),
      body: const Column(
        children: [
          ScialDayCTA()
        ]
      )
    );
  }

  List<SCAppBarButton> _actionButtons(BuildContext context) {
    return [
      SCAppBarButton(icon: SCIcons.book, onPressed: () => context.navigateToLocationPage()),
      const SCAppBarButton(icon: SCIcons.send)
    ];
  }
}