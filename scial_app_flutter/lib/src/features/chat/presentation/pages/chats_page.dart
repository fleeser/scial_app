import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatsPage extends StatelessWidget {

  const ChatsPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        appBar: SCAppBar(
          context: context,
          title: SCAppBarTitle(title: AppLocalizations.of(context)!.chats_app_bar_title),
          backButton: const SCAppBarBackButton(),
          actionButtons: _actionButtons
        ),
      )
    );
  }

  List<SCAppBarButton> get _actionButtons {
    return [
      const SCAppBarButton(icon: SCIcons.search),
      const SCAppBarButton(icon: SCIcons.plus)
    ];
  }
}