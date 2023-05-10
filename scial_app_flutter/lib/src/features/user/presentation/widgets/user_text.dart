import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class UserText extends StatelessWidget {

  const UserText({
    super.key,
    required this.addBottomPadding,
    required this.text
  });

  final bool addBottomPadding;
  final String text;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: SCGapSize.semiBig.getSpacing(theme),
        left: SCGapSize.semiBig.getSpacing(theme),
        right: SCGapSize.semiBig.getSpacing(theme),
        bottom: SCGapSize.semiBig.getSpacing(theme) + (addBottomPadding ? MediaQuery.of(context).padding.bottom : 0.0)
      ),
      child: Center(
        child: SCText.userText(text)
      )
    );
  }
}