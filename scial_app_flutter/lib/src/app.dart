import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends ConsumerWidget {

  const App({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final goRouter = ref.watch(appRouterProvider);

    return SCApp(
      debugShowCheckedModeBanner: false,
      colorMode: SCThemeColorMode.dark,
      routerConfig: goRouter,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: const Locale('de', 'DE')
    );
  }
}