import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCRatingText extends StatelessWidget {

  const SCRatingText({
    super.key,
    required this.shouldAddBottomPadding,
    required this.text
  });

  final bool shouldAddBottomPadding;
  final String text;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: SCGapSize.semiBig.getSpacing(theme) + (shouldAddBottomPadding ? MediaQuery.of(context).padding.bottom : 0.0),
        left: SCGapSize.semiBig.getSpacing(theme),
        right: SCGapSize.semiBig.getSpacing(theme),
        top: SCGapSize.semiBig.getSpacing(theme)
      ),
      child: Center(
        child: SCText(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            decoration: TextDecoration.none,
            package: 'scial_app_ui',
            color: theme.colors.profileErrorForeground
          )
        )
      )
    );
  }
}