import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/widgets/base/sc_circular_progress_indicator.dart';

class SCCTA extends StatelessWidget {

  const SCCTA({
    super.key,
    this.onPressed,
    required this.text,
    required this.buttonTitle,
    this.isLoading = false,
    this.isEnabled = true
  });

  final void Function()? onPressed;
  final String text;
  final String buttonTitle;
  final bool isLoading;
  final bool isEnabled;

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
          if (isLoading) SCCircularProgressIndicator(
            color: theme.colors.ctaText, 
            size: 14.0
          ),
          if (!isLoading) Expanded(child: SCText.ctaText(text)),
          const SCGap.semiBig(),
          SizedBox(
            height: 40.0,
            child: RawMaterialButton(
              onPressed: isEnabled && !isLoading ? onPressed : null,
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