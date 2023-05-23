import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/localization/presentation/widgets/localization_wrapper.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguagePage extends ConsumerWidget {

  const ChangeLanguagePage({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int? localeValue = ref.watch(localeProvider);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.change_language_app_bar_title),
        backButton: const SCAppBarBackButton()
      ),
      body: SCSelectableLangList(
        addBottomPadding: true,
        items: List.generate(4, (int index) => SCSelectableLangListItem(
          flag: [ null, SCFlags.de, SCFlags.gb, SCFlags.us ].elementAt(index),
          title: [ AppLocalizations.of(context)!.change_language_system_title, 'Deutsch (Deutschland)', 'English (Great Britain)', 'English (United States)' ].elementAt(index),
          isSelected: (index == 0 && localeValue == null) || index == localeValue
        )),
        onSelected: (int index) async {
          if (index == 0 && localeValue != null) {
            await KeyValueStorage.removeLocaleMode();
            ref.read(localeProvider.notifier).update((_) => null);
          } else if (index == 1 && localeValue != 1) {
            await KeyValueStorage.putLocaleMode(1);
            ref.read(localeProvider.notifier).update((_) => 1);
          } else if (index == 2 && localeValue != 2) {
            await KeyValueStorage.putLocaleMode(2);
            ref.read(localeProvider.notifier).update((_) => 2);
          } else if (index == 3 && localeValue != 3) {
            await KeyValueStorage.putLocaleMode(3);
            ref.read(localeProvider.notifier).update((_) => 3);
          }
        }
      )
    );
  }
}