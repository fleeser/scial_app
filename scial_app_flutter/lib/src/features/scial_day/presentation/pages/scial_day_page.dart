import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScialDayPage extends StatelessWidget {

  const ScialDayPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.scial_day_app_bar_title),
        backButton: const SCAppBarBackButton(),
        actionButtons: _actionButtons,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
          ]
        )
      )
    );
  }

  List<SCAppBarButton> get _actionButtons {
    return [
      const SCAppBarButton(icon: SCIcons.info) // TODO
    ];
  }
}