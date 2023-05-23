import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/settings/sc_settings_list_section.dart';

class SCSettingsList extends StatelessWidget {

  const SCSettingsList({
    super.key,
    this.addBottomPadding = false,
    this.sections = const []
  });

  final bool addBottomPadding;
  final List<SCSettingsListSection> sections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: addBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) => SCSettingsListSectionWidget(section: sections[index])
    );
  }
}