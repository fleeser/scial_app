import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/features/home/presentation/widgets/scial_day_cta.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.home_app_bar_title),
        actionButtons: _actionButtons,
      ),
      body: const Column(
        children: [
          ScialDayCTA()
        ]
      )
    );
  }

  List<SCAppBarButton> get _actionButtons {
    return [
      const SCAppBarButton(icon: SCIcons.book),
      const SCAppBarButton(icon: SCIcons.send)
    ];
  }
}