import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScialDayCTA extends StatelessWidget {

  const ScialDayCTA({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return Container(
      width: double.infinity,
      color: theme.colors.scialDayCTABackground,
      padding: const SCEdgeInsets.semiBig().toEdgeInsets(theme),
      child: Row(
        children: [
          Expanded(child: SCText.scialDayCTAText(AppLocalizations.of(context)!.home_scial_day_cta_text)),
          const SCGap.semiBig(),
          SizedBox(
            height: 40.0,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 0.0,
              padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.regular).toEdgeInsets(theme),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              fillColor: theme.colors.scialDayCTAButtonBackground,
              child: SCText.scialDayCTAButtonForeground(AppLocalizations.of(context)!.home_scial_day_cta_button_title)
            )
          )
        ]
      )
    );
  }
}