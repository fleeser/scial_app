import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSwitch extends StatelessWidget {

  const SCSwitch({
    super.key,
    required this.isOn,
    required this.onChanged
  });

  final bool isOn;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return Switch(
      value: isOn,
      onChanged: onChanged,
      activeColor: theme.colors.switchActiveForeground,
      activeTrackColor: theme.colors.switchActiveBackground,
      inactiveThumbColor: theme.colors.switchInactiveForeground,
      inactiveTrackColor: theme.colors.switchInactiveBackground
    );
  }
}