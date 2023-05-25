import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateEventSheetTime extends StatelessWidget {

  const CreateEventSheetTime({ 
    super.key,
    required this.date,
    required this.time,
    required this.onDateSelected,
    required this.onTimeSelected
  });

  final Datetime? date;
  final TimeOfDay? time;
  final void Function(DateTime) onDateSelected;
  final void Function(TimeOfDay) onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return SCPadding(
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SCPopupDateButton(
              emptyDateText: AppLocalizations.of(context)!.create_event_sheet_empty_time,
              initialDate: date,
              onSelected: onDateSelected,
              formatDate: (DateTime date) => date.toDynamicDateText(context)
            )
          ),
          const SCGap.regular(),
          Expanded(
            flex: 2,
            child: SCPopupTimeButton(
              emptyTimeText: AppLocalizations.of(context)!.create_event_sheet_empty_time,
              initialTime: time,
              onSelected: onTimeSelected,
              formatTime: (TimeOfDay time) => time.toStaticTimeText(context)
            )
          )
        ]
      )
    );
  }
}