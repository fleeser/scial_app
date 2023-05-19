import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/location/sc_location_list_item.dart';

class SCLocationList extends StatelessWidget {

  const SCLocationList({
    super.key,
    required this.items,
    this.addBottomPadding = false,
    this.onPressed
  });

  final List<SCLocationListItem> items;
  final bool addBottomPadding;
  final void Function(int)? onPressed;

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
      itemBuilder: (BuildContext context, int index) => SCLocationListItemWidget(
        index: index,
        item: items[index],
        onPressed: () => onPressed?.call(index)
      )
    );
  }
}