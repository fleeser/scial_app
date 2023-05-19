import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class LocationText extends StatelessWidget {

  const LocationText({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: SCGapSize.semiBig.getSpacing(theme),
        left: SCGapSize.semiBig.getSpacing(theme),
        right: SCGapSize.semiBig.getSpacing(theme),
        bottom: SCGapSize.semiBig.getSpacing(theme) + MediaQuery.of(context).padding.bottom
      ),
      child: Center(
        child: SCText.centerText(text)
      )
    );
  }
}