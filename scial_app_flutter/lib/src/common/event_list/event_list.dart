import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/common/event_list/event_list_item.dart';

class EventList extends StatelessWidget {

  const EventList({
    super.key,
    this.addBottomPadding = false,
    required this.events
  });

  final bool addBottomPadding;
  final List<PublicEvent> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // TODO: KeyPageStore
      itemCount: events.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: addBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) => EventListItem(event: events[index])
    );
  }
}