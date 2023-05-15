import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';

class NotificationsListItem extends StatelessWidget {

  const NotificationsListItem({
    super.key,
    required this.notification
  });

  final PublicNotification notification;

  @override
  Widget build(BuildContext context) {
    return notification is PublicNotificationFriendRequestCreated
      ? NotificationsListItemFriendRequestCreated(notification: notification as PublicNotificationFriendRequestCreated)
      : notification is PublicNotificationFriendRequestAccepted
        ? NotificationsListItemFriendRequestAccepted(notification: notification as PublicNotificationFriendRequestAccepted)
        : NotificationsListItemFriendRequestDenied(notification: notification as PublicNotificationFriendRequestDenied);
  }
}

class NotificationsListItemFriendRequestCreated extends StatelessWidget {

  const NotificationsListItemFriendRequestCreated({
    super.key,
    required this.notification
  });

  final PublicNotificationFriendRequestCreated notification;

  @override
  Widget build(BuildContext context) {
    return Text('wtf1');
  }
}

class NotificationsListItemFriendRequestAccepted extends StatelessWidget {

  const NotificationsListItemFriendRequestAccepted({
    super.key,
    required this.notification
  });

  final PublicNotificationFriendRequestAccepted notification;

  @override
  Widget build(BuildContext context) {
    return Text('wtf2');
  }
}

class NotificationsListItemFriendRequestDenied extends StatelessWidget {

  const NotificationsListItemFriendRequestDenied({
    super.key,
    required this.notification
  });

  final PublicNotificationFriendRequestDenied notification;

  @override
  Widget build(BuildContext context) {
    return Text('wtf3');
  }
}