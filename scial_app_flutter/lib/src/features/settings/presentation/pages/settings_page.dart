import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/settings/presentation/controller/settings_controller.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends ConsumerStatefulWidget {

  const SettingsPage({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.settings_app_bar_title),
        backButton: const SCAppBarBackButton()
      ),
      body: SCSettingsList(
        sections: [
          SCSettingsListSection(
            title: AppLocalizations.of(context)!.settings_section_appearance_title,
            items: [
              SCSettingsListSectionItem(
                title: AppLocalizations.of(context)!.settings_section_appearance_item_change_theme_title, 
                icon: SCIcons.moon,
                onPressed: _handleChangeTheme
              )
            ]
          ),
          SCSettingsListSection(
            title: AppLocalizations.of(context)!.settings_section_language_and_region_title,
            items: [
              SCSettingsListSectionItem(
                title: AppLocalizations.of(context)!.settings_section_language_and_region_item_change_language_title, 
                icon: SCIcons.globe,
                onPressed: _handleChangeLanguage
              )
            ]
          )
        ]
      )
    );
  }

  void _handleChangeTheme() {
    final controller = ref.read(settingsControllerProvider.notifier);
    controller.handleChangeTheme(context);
  }

  void _handleChangeLanguage() {
    final controller = ref.read(settingsControllerProvider.notifier);
    controller.handleChangeLanguage(context);
  }
}