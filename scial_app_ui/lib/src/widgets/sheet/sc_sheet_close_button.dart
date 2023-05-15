import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSheetCloseButton extends StatelessWidget {

  const SCSheetCloseButton({ 
    super.key,
    required this.isEnabled
  });

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: RawMaterialButton(
        onPressed: () => isEnabled 
          ? _onPressed(context) 
          : null,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        fillColor: theme.colors.sheetCancelButtonBackground,
        enableFeedback: isEnabled,
        child: SCIcon(
          icon: SCIcons.x,
          color: theme.colors.sheetCancelButtonForeground,
          size: 20.0
        )
      )
    );
  }

  void _onPressed(BuildContext context) {
    Navigator.pop(context);
  }
}