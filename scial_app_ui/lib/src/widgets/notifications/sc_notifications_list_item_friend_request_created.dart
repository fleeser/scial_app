import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/notifications/sc_notifications_list.dart';

class SCNotificationsListItemFriendRequestCreated extends StatelessWidget {

  const SCNotificationsListItemFriendRequestCreated({
    super.key,
    required this.read,
    required this.created,
    required this.data
  });

  final bool read;
  final DateTime created;
  final SCNotificationDataFriendRequestCreated data;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}