import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final themeProvider = StateProvider.autoDispose<SCThemeColorMode>((ref) {
  int? themeValue = KeyValueStorage.getThemeMode();

  switch (themeValue) {
    case 1: return SCThemeColorMode.light;
    case 2: return SCThemeColorMode.dark;
    default: 
      Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      
      return brightness == Brightness.light
        ? SCThemeColorMode.light
        : SCThemeColorMode.dark;
  }
});

final localeProvider = StateProvider.autoDispose<Locale>((ref) {
  Locale? localeValue = KeyValueStorage.getLocale();

  if (localeValue != null) return localeValue;

  return SchedulerBinding.instance.platformDispatcher.locale;
});

class App extends ConsumerStatefulWidget {

  const App({ super.key });

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);

    await KeyValueStorage.closeThemeBox();
    await KeyValueStorage.closeLocalizationBox();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    int? themeValue = KeyValueStorage.getThemeMode();

    if (themeValue == null) {

      Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

      ref.read(themeProvider.notifier).update((SCThemeColorMode mode) => brightness == Brightness.light
        ? SCThemeColorMode.light
        : SCThemeColorMode.dark
      );
    }
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);

    if (locales == null || locales.isEmpty) return;

    ref.read(localeProvider.notifier).update((Locale locale) => locales.first);
  }

  @override
  Widget build(BuildContext context) {

    final goRouter = ref.watch(appRouterProvider);
    final colorMode = ref.watch(themeProvider);

    return SCApp(
      debugShowCheckedModeBanner: false,
      colorMode: colorMode,
      routerConfig: goRouter,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: const Locale('de', 'DE')
    );
  }
}