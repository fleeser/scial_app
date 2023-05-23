import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScialDayCTA extends StatelessWidget {

  const ScialDayCTA({ super.key });

  @override
  Widget build(BuildContext context) {
    return SCCTA(
      onPressed: () => _handlePress(context),
      text: AppLocalizations.of(context)!.home_scial_day_cta_text, 
      buttonTitle: AppLocalizations.of(context)!.home_scial_day_cta_button_title
    );
  }

  void _handlePress(BuildContext context) {
    context.navigateToScialDayPage();
  }
}