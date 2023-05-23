import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/selectable/selectable_lang_list/sc_selectable_lang_list_item.dart';

class SCSelectableLangList extends StatelessWidget {

  const SCSelectableLangList({
    super.key,
    this.addBottomPadding = false,
    this.items = const [],
    this.onSelected
  });

  final bool addBottomPadding;
  final List<SCSelectableLangListItem> items;
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
      itemBuilder: (BuildContext context, int index) => SCSelectableLangListItemWidget(
        item: items[index],
        onSelected: () => onSelected != null ? onSelected!(index) : null
      )
    );
  }
}