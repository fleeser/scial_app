import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/selectable/selectable_list/sc_selectable_list_item.dart';

class SCSelectableList extends StatelessWidget {

  const SCSelectableList({
    super.key,
    this.addBottomPadding = false,
    this.items = const [],
    this.onSelected
  });

  final bool addBottomPadding;
  final List<SCSelectableListItem> items;
  final void Function(int)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: addBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) => SCSelectableListItemWidget(
        item: items[index],
        onSelected: () => onSelected != null ? onSelected!(index) : null
      )
    );
  }
}