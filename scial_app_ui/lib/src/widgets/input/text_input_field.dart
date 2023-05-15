import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCTextInputField extends StatelessWidget {

  const SCTextInputField.email({
    super.key,
    this.controller,
    required this.hint,
    this.enabled = true
  })
  : icon = SCIcons.mail,
    obscure = false,
    keyboardType = TextInputType.emailAddress;

  const SCTextInputField.password({
    super.key,
    this.controller,
    required this.hint,
    this.enabled = true
  })
  : icon = SCIcons.lock,
    obscure = true,
    keyboardType = TextInputType.text;

  const SCTextInputField.name({
    super.key,
    this.controller,
    required this.hint,
    this.enabled = true
  })
  : icon = SCIcons.tag,
    obscure = false,
    keyboardType = TextInputType.name;

  final TextEditingController? controller;
  final bool obscure;
  final SCIcons icon;
  final String? hint;
  final TextInputType keyboardType;
  final bool enabled;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        color: theme.colors.textInputFieldBackground,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Row(
        children: [
          SCPadding(
            padding: const SCEdgeInsets.only(left: SCGapSize.regular),
            child: SCIcon(
              icon: icon,
              size: 24.0,
              color: theme.colors.textInputIcon
            )
          ),
          Expanded(
            child: TextField(
              enabled: enabled,
              autocorrect: false,
              obscureText: obscure,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.regular).toEdgeInsets(theme),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hint,
                hintStyle: theme.typography.textInputFieldHint.copyWith(color: theme.colors.textInputHint)
              ),
              style: theme.typography.textInputFieldText.copyWith(color: theme.colors.textInputText)
            )
          )
        ]
      )
    );
  }
}