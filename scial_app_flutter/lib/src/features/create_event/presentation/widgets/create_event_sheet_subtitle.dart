import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class CreateEventSheetSubtitle extends StatelessWidget {

  const CreateEventSheetSubtitle({
    super.key,
    required this.subtitle
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SCPadding(
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
      child: SCText.sheetSubTitle(subtitle)
    );
  }
}