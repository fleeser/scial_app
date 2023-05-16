import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/widgets/notifications_list_item.dart';

class NotificationsList extends StatelessWidget {

  const NotificationsList({
    super.key,
    required this.notifications,
    required this.setRead,
    this.acceptRequest,
    this.denyRequest
  });

  final List<PublicNotification> notifications;
  final void Function(int) setRead;
  final Future<bool> Function(int)? acceptRequest;
  final Future<bool> Function(int)? denyRequest;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // TODO: KeyPageStore
      itemCount: notifications.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) => NotificationsListItem(
        notification: notifications[index], 
        setRead: setRead,
        acceptRequest: () => acceptRequest!.call(notifications[index].id),
        denyRequest: () => denyRequest!.call(notifications[index].id)
      )
    );
  }
}