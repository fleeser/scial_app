import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/localization/presentation/widgets/localization_wrapper.dart';
import 'package:scial_app_flutter/src/features/theme/presentation/widgets/theme_wrapper.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends ConsumerWidget {

  const App ({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final goRouter = ref.watch(appRouterProvider);
    final themeValue = ref.watch(themeProvider);
    final localeValue = ref.watch(localeProvider);

    SCThemeColorMode colorMode() {
      switch (themeValue) {
        case 1: return SCThemeColorMode.light;
        case 2: return SCThemeColorMode.dark;
        default: return SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light ? SCThemeColorMode.light : SCThemeColorMode.dark;
      }
    }

    Locale locale() {
      switch (localeValue) {
        case 1: return const Locale('de', 'DE');
        case 2: return const Locale('en', 'GB');
        case 3: return const Locale('en', 'US');
        default: return SchedulerBinding.instance.platformDispatcher.locale;
      }
    }

    return LocalizationWrapper(
      child: ThemeWrapper(
        child: SCApp(
          debugShowCheckedModeBanner: false,
          colorMode: colorMode(),
          routerConfig: goRouter,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: locale()
        )
      )
    );
  }
}