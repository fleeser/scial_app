import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSettingsListSectionItem {

  const SCSettingsListSectionItem({
    required this.title,
    required this.icon,
    this.onPressed
  });

  final String title;
  final SCIcons icon;
  final void Function()? onPressed;
}

class SCSettingsListSectionItemWidget extends StatelessWidget {

  const SCSettingsListSectionItemWidget({
    super.key,
    required this.item
  });

  final SCSettingsListSectionItem item;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 30.0 + 2.0 * SCGapSize.regular.getSpacing(theme),
      child: RawMaterialButton(
        onPressed: item.onPressed,
        elevation: 0.0,
        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig).toEdgeInsets(theme),
        child: Row(
          children: [
            SCIcon(
              icon: item.icon,
              color: theme.colors.settingsSectionItemIcon,
              size: 30.0
            ),
            const SCGap.semiBig(),
            Expanded(child: SCText.settingsSectionItemTitle(item.title))
          ]
        )
      )
    );
  }
}