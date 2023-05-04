import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/widgets/base/sc_circular_progress_indicator.dart';

class SCDialogButton {

  const SCDialogButton({
    this.onPressed,
    required this.title,
    this.isPrimary = false
  });

  final FutureOr<bool>? onPressed;
  final String title;
  final bool isPrimary;
}

class SCDialogYesNoButton {

  const SCDialogYesNoButton({
    this.onPressed,
    required this.title
  });

  final FutureOr<bool>? onPressed;
  final String title;
}

// TODO Stop closing and also only one button should be clickable 

class SCDialogButtonWidget extends StatelessWidget {

  const SCDialogButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.isPrimary = false,
    this.isLoading = false,
    this.isEnabled = true
  });

  final void Function() onPressed;
  final String title;
  final bool isPrimary;
  final bool isLoading;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 40.0,
      child: RawMaterialButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        elevation: 0.0,
        enableFeedback: isEnabled && !isLoading,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        fillColor: isPrimary
          ? theme.colors.dialogButtonPrimaryBackground
          : theme.colors.dialogButtonSecondaryBackground,
        child: isLoading
          ? SCCircularProgressIndicator(
            color: isPrimary
              ? theme.colors.dialogButtonPrimaryForeground
              : theme.colors.dialogButtonSecondaryForeground, 
            size: 20.0
          )
          : SCText.dialogButton(
            title,
            color: isPrimary
              ? theme.colors.dialogButtonPrimaryForeground
              : theme.colors.dialogButtonSecondaryForeground
          )
      )
    );
  }
}