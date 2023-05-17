import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class DiscoverFiltersSheetTitle extends StatelessWidget {

  const DiscoverFiltersSheetTitle({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SCPadding(
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
      child: SCText.discoverFiltersTitle(title)
    );
  }
}