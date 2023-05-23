import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSelectableLangListItem {

  const SCSelectableLangListItem({
    this.flag,
    required this.title,
    this.isSelected = false
  });

  final SCFlags? flag;
  final String title;
  final bool isSelected;
}

class SCSelectableLangListItemWidget extends StatelessWidget {

  const SCSelectableLangListItemWidget({
    super.key,
    required this.item,
    this.onSelected
  });

  final SCSelectableLangListItem item;
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
            if (item.flag != null) SCFlag(
              flag: item.flag!,
              height: 30.0
            ),
            if (item.flag != null) const SCGap.semiBig(),
            Expanded(
              child: item.isSelected
                ? SCText.selectableLangListItemTitleSelected(item.title)
                : SCText.selectableLangListItemTitleUnselected(item.title)
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
                    ? theme.colors.selectableLangListItemIndicatorSelected
                    : theme.colors.selectableLangListItemIndicatorUnselected
                )
              ),
              child: item.isSelected
                ? Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colors.selectableLangListItemIndicatorSelected
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