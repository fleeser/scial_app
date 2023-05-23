import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/widgets/settings/sc_settings_list_section_item.dart';

class SCSettingsListSection {

  const SCSettingsListSection({
    required this.title,
    this.items = const []
  });

  final String title;
  final List<SCSettingsListSectionItem> items;
}

class SCSettingsListSectionWidget extends StatelessWidget {

  const SCSettingsListSectionWidget({
    super.key,
    required this.section
  });

  final SCSettingsListSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SCPadding(
          padding: const SCEdgeInsets.symmetric(
            horizontal: SCGapSize.semiBig,
            vertical: SCGapSize.regular
          ),
          child: SCText.settingsSectionTitle(section.title)
        ),
        ...List.generate(section.items.length, (int index) => SCSettingsListSectionItemWidget(item: section.items[index]))
      ]
    );
  }
}