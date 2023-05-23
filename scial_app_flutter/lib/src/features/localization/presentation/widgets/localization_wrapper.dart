import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';

final localeProvider = StateProvider.autoDispose<int?>((ref) {
  return KeyValueStorage.getLocaleMode();
});

class LocalizationWrapper extends ConsumerStatefulWidget {

  const LocalizationWrapper({ 
    super.key,
    required this.child
  });

  final Widget child;

  @override
  ConsumerState<LocalizationWrapper> createState() => _LocalizationWrapperState();
}

class _LocalizationWrapperState extends ConsumerState<LocalizationWrapper> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);

    await KeyValueStorage.closeLocalizationBox();
    super.dispose();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);

    if (locales == null || locales.isEmpty) return;

    int? localeValue = ref.read(localeProvider);
    
    if (localeValue == null) {
      ref.read(localeProvider.notifier).update((_) => null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}