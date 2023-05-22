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
      width: kToolbarHeight - 10.0,
      height: kToolbarHeight - 10.0,
      child: RawMaterialButton(
        onPressed: () => isEnabled 
          ? _onPressed(context) 
          : null,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((kToolbarHeight - 10.0) / 1.0)),
        fillColor: theme.colors.sheetCancelButtonBackground,
        enableFeedback: isEnabled,
        child: SCIcon(
          icon: SCIcons.x,
          color: theme.colors.sheetCancelButtonForeground,
          size: (kToolbarHeight - 10.0) / 2.0
        )
      )
    );
  }

  void _onPressed(BuildContext context) {
    Navigator.pop(context);
  }
}