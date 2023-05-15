import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/widgets/notifications_list_item.dart';

class NotificationsList extends StatelessWidget {

  const NotificationsList({
    super.key,
    required this.notifications
  });

  final List<PublicNotification> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // TODO: KeyPageStore
      itemCount: notifications.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) => NotificationsListItem(notification: notifications[index])
    );
  }
}