import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCLocationListItem {

  const SCLocationListItem({
    required this.name
  });

  final String name;
}

class SCLocationListItemWidget extends StatelessWidget {

  const SCLocationListItemWidget({
    super.key,
    required this.index,
    required this.item,
    this.onPressed
  });

  final int index;
  final SCLocationListItem item;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 2.0 * SCGapSize.regular.getSpacing(theme) + 3.0 * 1.5 * 14.0,
      width: double.infinity,
      child: RawMaterialButton(
        onPressed: onPressed,
        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig).toEdgeInsets(theme),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SCText.locationListItemText(item.name)
        )
      )
    );
  }
}