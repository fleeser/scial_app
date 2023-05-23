import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/notifications/sc_notifications_list.dart';

class SCNotificationsListItemFriendRequestAccepted extends StatelessWidget {

  const SCNotificationsListItemFriendRequestAccepted({
    super.key,
    required this.read,
    required this.created,
    required this.data,
    required this.formatTime
  });

  final bool read;
  final DateTime created;
  final SCNotificationDataFriendRequestAccepted data;
  final String Function(DateTime) formatTime;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}