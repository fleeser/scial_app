import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/widgets/base/sc_circular_progress_indicator.dart';

class SCButton extends StatelessWidget {

  const SCButton.filled({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.title,
    this.icon
  })
  : outlined = false;

  const SCButton.outlined({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.title,
    this.icon
  })
  : outlined = true;

  final void Function()? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final String? title;
  final SCIcons? icon;
  final bool outlined;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Container(
      height: 48.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: outlined
            ? theme.colors.accent
            : Colors.transparent,
          width: outlined
            ? 2.0
            : 0.0
        )
      ),
      child: SizedBox(
        height: 48.0,
        width: double.infinity,
        child: RawMaterialButton(
          onPressed: isEnabled && !isLoading ? onPressed : null,
          elevation: 0.0,
          enableFeedback: isEnabled && !isLoading,
          fillColor: outlined
            ? null
            : theme.colors.accent,
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.regular).toEdgeInsets(theme),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: isLoading
            ? SCCircularProgressIndicator(
              color: outlined
                ? theme.colors.accent
                : theme.colors.onAccent,
              size: 20.0
            )
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) SCIcon(
                  icon: icon!,
                  color: outlined
                    ? theme.colors.accent
                    : theme.colors.onAccent,
                  size: 20.0
                ),
                if (icon != null && title != null) const SCGap.semiBig(),
                if (title != null) Flexible(
                  child: SCText.buttonTitle(
                    title!, 
                    color: outlined 
                      ? theme.colors.accent 
                      : null
                    )
                  )
              ]
            )
        )
      )
    );
  }
}