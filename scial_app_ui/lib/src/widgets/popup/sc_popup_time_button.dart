import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCPopupTimeButton extends StatelessWidget {

  const SCPopupTimeButton({
    super.key,
    this.selectedTimeText,
    required this.emptyTimeText
  });

  final String? selectedTimeText;
  final String emptyTimeText;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: RawMaterialButton(
        onPressed: () {},
        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiSmall).toEdgeInsets(theme),
        fillColor: theme.colors.popupButtonBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 0.0,
        child: Row(
          children: [
            SCIcon(
              icon: SCIcons.clock,
              color: theme.colors.popupButtonIcon,
              size: 24.0
            ),
            const SCGap.semiSmall(),
            Expanded(
              child: SCText.popupButtonText(selectedTimeText ?? emptyTimeText)
            )
          ]
        )
      )
    );
  }
}