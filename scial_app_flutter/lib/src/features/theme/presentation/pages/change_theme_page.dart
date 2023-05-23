import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/theme/presentation/widgets/theme_wrapper.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeThemePage extends ConsumerWidget {

  const ChangeThemePage({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int? themeValue = ref.watch(themeProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.change_theme_app_bar_title),
        backButton: const SCAppBarBackButton()
      ),
      body: SCSelectableList(
        addBottomPadding: true,
        items: List.generate(3, (int index) => SCSelectableListItem(
          icon: [ SCIcons.smartphone, SCIcons.sun, SCIcons.moon ].elementAt(index), 
          title: [ AppLocalizations.of(context)!.change_theme_system_title, AppLocalizations.of(context)!.change_theme_light_title, AppLocalizations.of(context)!.change_theme_dark_title ].elementAt(index),
          isSelected: (index == 0 && themeValue == null) || (index == 1 && themeValue == 1) || (index == 2 && themeValue == 2)
        )),
        onSelected: (int index) async {
          if (index == 0 && themeValue != null) {
            await KeyValueStorage.removeThemeMode();
            ref.read(themeProvider.notifier).update((_) => null);
          } else if (index == 1 && themeValue != 1) {
            await KeyValueStorage.putThemeMode(1);
            ref.read(themeProvider.notifier).update((_) => 1);
          } else if (index == 2 && themeValue != 2) {
            await KeyValueStorage.putThemeMode(2);
            ref.read(themeProvider.notifier).update((_) => 2);
          }
        }
      )
    );
  }
}