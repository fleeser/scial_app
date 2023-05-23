import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCCTA extends StatelessWidget {

  const SCCTA({
    super.key,
    this.onPressed,
    required this.text,
    required this.buttonTitle
  });

  final void Function()? onPressed;
  final String text;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return Container(
      width: double.infinity,
      color: theme.colors.ctaBackground,
      padding: const SCEdgeInsets.semiBig().toEdgeInsets(theme),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SCText.ctaText(text)),
          const SCGap.semiBig(),
          SizedBox(
            height: 40.0,
            child: RawMaterialButton(
              onPressed: onPressed,
              elevation: 0.0,
              padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.regular).toEdgeInsets(theme),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              fillColor: theme.colors.ctaButtonBackground,
              child: SCText.ctaButtonText(buttonTitle)
            )
          )
        ]
      )
    );
  }
}