import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCTextInputBox extends StatelessWidget {

  const SCTextInputBox({
    super.key,
    this.controller,
    required this.hint,
    this.enabled = true
  });

  final TextEditingController? controller;
  final String? hint;
  final bool enabled;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return TextField(
      controller: controller,
      enabled: enabled,
      minLines: 3,
      maxLines: null,
      autocorrect: false,
      decoration: InputDecoration(
        contentPadding: const SCEdgeInsets.all(SCGapSize.regular).toEdgeInsets(theme),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
        hintText: hint,
        fillColor: theme.colors.textInputBoxBackground,
        filled: true,
        hintStyle: theme.typography.textInputBoxHint.copyWith(color: theme.colors.textInputHint)
      ),
      style: theme.typography.textInputBoxHint.copyWith(color: theme.colors.textInputText)
    );
  }
}