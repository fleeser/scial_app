import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';

final themeProvider = StateProvider.autoDispose<int?>((ref) {
  return KeyValueStorage.getThemeMode();
});

class ThemeWrapper extends ConsumerStatefulWidget {

  const ThemeWrapper({ 
    super.key,
    required this.child
  });

  final Widget child;

  @override
  ConsumerState<ThemeWrapper> createState() => _ThemeWrapperState();
}

class _ThemeWrapperState extends ConsumerState<ThemeWrapper> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);

    await KeyValueStorage.closeThemeBox();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    int? themeValue = ref.read(themeProvider);

    if (themeValue == null) {
      ref.read(themeProvider.notifier).update((_) => null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}