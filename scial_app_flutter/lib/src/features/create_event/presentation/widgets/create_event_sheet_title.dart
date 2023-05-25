import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateEventSheetTitle extends StatelessWidget {

  const CreateEventSheetTitle({ 
    super.key,
    required this.controller
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SCPadding(
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
      child: SCTextInputField(
        controller: controller,
        hint: AppLocalizations.of(context)!.create_event_sheet_title_field_hint
      )
    );
  }
}