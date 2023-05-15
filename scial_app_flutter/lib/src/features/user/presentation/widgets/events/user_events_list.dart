import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/events/user_events_list_item.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class UserEventsList extends StatelessWidget {

  const UserEventsList({
    super.key,
    required this.addBottomPadding,
    required this.events
  });

  final bool addBottomPadding;
  final List<PublicUserEvent> events;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return ListView.builder(
      // TODO: KeyPageStore
      itemCount: events.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: SCGapSize.semiBig.getSpacing(theme),
        right: SCGapSize.semiBig.getSpacing(theme),
        bottom: addBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) => UserEventsListItem(event: events[index])
    );
  }
}