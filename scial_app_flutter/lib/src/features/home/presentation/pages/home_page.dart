import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/features/location/presentation/widgets/location_cta.dart';
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
      body: Column(
        children: [
          SCCTA(
            onPressed: () {},
            text: AppLocalizations.of(context)!.home_scial_day_cta_text, 
            buttonTitle: AppLocalizations.of(context)!.home_scial_day_cta_button_title
          ),
          const LocationCTA()
        ]
      )
    );
  }

  List<SCAppBarButton> _actionButtons(BuildContext context) {
    return [
      const SCAppBarButton(icon: SCIcons.book),
      SCAppBarButton(
        onPressed: () => context.navigateToChatsPage(),
        icon: SCIcons.send
      )
    ];
  }
}