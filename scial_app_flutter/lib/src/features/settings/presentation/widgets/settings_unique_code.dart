import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsUniqueCode extends StatelessWidget {

  const SettingsUniqueCode({ super.key });

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Container(
      width: double.infinity,
      padding: const SCEdgeInsets.symmetric(
        horizontal: SCGapSize.semiBig,
        vertical: SCGapSize.regular
      ).toEdgeInsets(theme),
      color: theme.colors.settingsUniqueCodeBackground,
      child: Row(
        children: [
          SCText.settingsUniqueCodeTitle('${ AppLocalizations.of(context)!.settings_unique_code_title }:'),
          const SCGap.regular(),
          Expanded(child: SCText.settingsUniqueCodeText('#${ KeyValueStorage.getUniqueCode() }'))
        ]
      )
    );
  }
}