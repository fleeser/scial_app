import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSheetButton {

  const SCSheetButton({
    this.onPressed,
    required this.title
  });

  final FutureOr<bool> Function()? onPressed;
  final String title;
}

class SCSheetButtonWidget extends StatelessWidget {

  const SCSheetButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.isEnabled = true
  });

  final void Function() onPressed;
  final String title;
  final bool isLoading;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SCButton.filled(
      onPressed: onPressed,
      isEnabled: isEnabled && !isLoading,
      isLoading: isLoading,
      title: title
    );
  }
}