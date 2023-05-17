import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCCircularSelectable extends StatelessWidget {

  const SCCircularSelectable({ 
    super.key,
    required this.emojis,
    required this.selectedIndexes,
    required this.onPressed
  });

  final List<String> emojis;
  final List<int> selectedIndexes;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 2.0 * SCGapSize.regular.getSpacing(theme) + 56.0,
      child: ListView.builder(
        itemCount: emojis.length,
        shrinkWrap: true,
        padding: const SCEdgeInsets.symmetric(vertical: SCGapSize.regular).toEdgeInsets(theme),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => SCCircularSelectableItem(
          index: index,
          isSelected: selectedIndexes.contains(index),
          isLast: index == emojis.length - 1,
          emoji: emojis[index],
          onPressed: () => onPressed.call(index)
        )
      )
    );
  }
}

class SCCircularSelectableItem extends StatelessWidget {

  const SCCircularSelectableItem({
    super.key,
    required this.index,
    required this.isSelected,
    required this.isLast,
    required this.emoji,
    required this.onPressed
  });

  final int index;
  final bool isSelected;
  final bool isLast;
  final String emoji;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SCPadding(
      padding: SCEdgeInsets.only(
        left: index == 0 ? SCGapSize.semiBig : SCGapSize.semiSmall,
        right: isLast ? SCGapSize.semiBig : SCGapSize.semiSmall
      ),
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colors.circularSelectorBackground,
          border: Border.all(
            width: 2.0,
            color: isSelected
              ? theme.colors.circularSelectorSelectedBorder
              : theme.colors.circularSelectorBackground
          )
        ),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: RawMaterialButton(
            onPressed: onPressed,
            elevation: 0.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56.0 / 2.0)),
            child: Text(
              emoji,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28.0)
            )
          )
        )
      )
    );
  }
}