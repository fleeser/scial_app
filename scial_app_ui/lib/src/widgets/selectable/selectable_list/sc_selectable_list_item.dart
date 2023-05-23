import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSelectableListItem {

  const SCSelectableListItem({
    required this.icon,
    required this.title,
    this.isSelected = false
  });

  final SCIcons icon;
  final String title;
  final bool isSelected;
}

class SCSelectableListItemWidget extends StatelessWidget {

  const SCSelectableListItemWidget({
    super.key,
    required this.item,
    this.onSelected
  });

  final SCSelectableListItem item;
  final void Function()? onSelected;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 30.0 + 2.0 * SCGapSize.regular.getSpacing(theme),
      child: RawMaterialButton(
        onPressed: onSelected != null ? onSelected! : null,
        elevation: 0.0,
        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig).toEdgeInsets(theme),
        child: Row(
          children: [
            SCIcon(
              icon: item.icon,
              color: item.isSelected
                ? theme.colors.selectableListItemIconSelected
                : theme.colors.selectableListItemIconUnselected,
              size: 30.0
            ),
            const SCGap.semiBig(),
            Expanded(
              child: item.isSelected
                ? SCText.selectableListItemTitleSelected(item.title)
                : SCText.selectableListItemTitleUnselected(item.title)
            ),
            const SCGap.semiBig(),
            Container(
              width: 24.0,
              height: 24.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: item.isSelected
                    ? theme.colors.selectableListItemIndicatorSelected
                    : theme.colors.selectableListItemIndicatorUnselected
                )
              ),
              child: item.isSelected
                ? Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colors.selectableListItemIndicatorSelected
                  )
                )
                : null
            )
          ]
        )
      )
    );
  }
}