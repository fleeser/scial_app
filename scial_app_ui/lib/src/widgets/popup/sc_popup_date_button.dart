import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCPopupDateButton extends StatelessWidget {

  const SCPopupDateButton({
    super.key,
    this.initialDate,
    required this.emptyDateText,
    this.onSelected,
    required this.formatDate
  });

  final DateTime? initialDate;
  final String emptyDateText;
  final void Function(DateTime)? onSelected;
  final String Function(DateTime) formatDate;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: RawMaterialButton(
        onPressed: () async {
          DateTime? selectedDateTime = await showDatePicker(
            context: context, 
            initialDate: initialDate ?? DateTime.now(), 
            firstDate: DateTime.now().subtract(const Duration(days: 10)), 
            lastDate: DateTime.now().add(const Duration(days: 100))
          );

          if (selectedDateTime != null && onSelected != null) {
            onSelected!.call(selectedDateTime);
          }
        },
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
              child: SCText.popupButtonText(
                initialDate == null
                  ? emptyDateText
                  : formatDate.call(initialDate!)
              )
            )
          ]
        )
      )
    );
  }
}