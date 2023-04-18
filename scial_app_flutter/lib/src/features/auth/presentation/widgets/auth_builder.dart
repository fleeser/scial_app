import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/responsive/responsive.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class AuthBuilder extends StatelessWidget {

  const AuthBuilder({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children
  });

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: SCGapSize.semiBig.getSpacing(theme),
            right: SCGapSize.semiBig.getSpacing(theme),
            top: SCGapSize.semiBig.getSpacing(theme),
            bottom: Responsive.isKeyboardVisible(context)
              ? Responsive.keyboardHeight(context) + SCGapSize.semiBig.getSpacing(theme)
              : Responsive.bottomPadding(context) + SCGapSize.semiBig.getSpacing(theme)
          ),
          child: Column(
            children: [
              SCText.title1(title),
              const AppGap.semiBig(),
              SCText.paragraph1(subtitle),
              const AppGap.semiBig(),
              Column(children: children)
            ]
          )
        )
      )
    );
  }
}