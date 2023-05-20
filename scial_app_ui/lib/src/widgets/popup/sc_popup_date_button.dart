import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCPopupDateButton extends StatelessWidget {

  const SCPopupDateButton({
    super.key,
    this.selectedDateText,
    required this.emptyDateText
  });

  final String? selectedDateText;
  final String emptyDateText;

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
              icon: SCIcons.calendar,
              color: theme.colors.popupButtonIcon,
              size: 24.0
            ),
            const SCGap.semiSmall(),
            Expanded(
              child: SCText.popupButtonText(selectedDateText ?? emptyDateText)
            )
          ]
        )
      )
    );
  }
}