import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

class SCPinInput extends StatelessWidget {

  const SCPinInput.verification({
    super.key,
    required this.onCompleted,
    this.controller,
    this.focusNode,
    this.enabled = true,
    this.error = false
  })
  : length = 6;

  final void Function(String pin) onCompleted;
  final int length;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final bool error;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    final PinTheme defaultPinTheme = PinTheme(
      width: 56.0,
      height: 60.0,
      textStyle: theme.typography.pinInput.copyWith(color: theme.colors.pinInputForeground),
      decoration: BoxDecoration(
        color: theme.colors.pinInputBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.transparent)
      )
    );

    return SizedBox(
      height: 68.0,
      child: Pinput(
        enabled: enabled,
        length: length,
        forceErrorState: error,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68.0,
          width: 64.0,
          decoration: defaultPinTheme.decoration!.copyWith(border: Border.all(color: theme.colors.pinInputFocusBorder))
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: theme.colors.pinInputErrorBorder,
            borderRadius: BorderRadius.circular(12.0)
          )
        ),
        onCompleted: onCompleted
      )
    );
  }
}