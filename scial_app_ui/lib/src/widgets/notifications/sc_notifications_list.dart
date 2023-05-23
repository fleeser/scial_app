import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/notifications/sc_notifications_list_item_friend_request_accepted.dart';
import 'package:scial_app_ui/src/widgets/notifications/sc_notifications_list_item_friend_request_created.dart';
import 'package:scial_app_ui/src/widgets/notifications/sc_notifications_list_item_friend_request_denied.dart';

class SCNotificationsList extends StatelessWidget {

  const SCNotificationsList({
    super.key,
    required this.notifications,
    this.addBottomPadding = false,
    required this.formatTime
  });

  final List<SCNotification> notifications; 
  final bool addBottomPadding;
  final String Function(DateTime) formatTime;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: addBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) {

        SCNotification notification = notifications[index];

        switch (notification.type) {
          case SCNotificationType.friendRequestCreated: return SCNotificationsListItemFriendRequestCreated(read: notification.read, created: notification.created, data: notification.data as SCNotificationDataFriendRequestCreated, formatTime: formatTime);
          case SCNotificationType.friendRequestAccepted: return SCNotificationsListItemFriendRequestAccepted(read: notification.read, created: notification.created, data: notification.data as SCNotificationDataFriendRequestAccepted, formatTime: formatTime);
          default: return SCNotificationsListItemFriendRequestDenied(read: notification.read, created: notification.created, data: notification.data as SCNotificationDataFriendRequestDenied, formatTime: formatTime);
        }
      }
    );
  }
}

enum SCNotificationType {
  friendRequestCreated,
  friendRequestAccepted,
  friendRequestDenied,
  eventGuestInvitationCreated,
  eventGuestInvitationAccepted,
  eventGuestInvitationDenied,
  eventGuestRequestCreated,
  eventGuestRequestAccepted,
  eventGuestRequestDenied,
  eventGuestSuggestionCreated,
  eventGuestSuggestionAccepted,
  eventGuestSuggestionDenied,
  eventHostInvitationCreated,
  eventHostInvitationAccepted,
  eventHostInvitationDenied,
  eventHostRequestCreated,
  eventHostRequestAccepted,
  eventHostRequestDenied,
  eventHostSuggestionCreated,
  eventHostSuggestionAccepted,
  eventHostSuggestionDenied
}

enum SCNotificationDataFriendRequestCreatedStatus {
  pending,
  accepted,
  denied
}

class SCNotification {

  const SCNotification({
    required this.type,
    required this.read,
    required this.created,
    required this.data
  });

  final SCNotificationType type;
  final bool read;
  final DateTime created;
  final dynamic data;
}

class SCNotificationDataFriendRequestCreated {

  const SCNotificationDataFriendRequestCreated({
    required this.created,
    required this.status,
    this.sender,
    this.text
  });

  final DateTime created;
  final SCNotificationDataFriendRequestCreatedStatus status;
  final SCNotificationDataFriendRequestCreatedSender? sender;
  final String? text;
}

class SCNotificationDataFriendRequestCreatedSender {

  const SCNotificationDataFriendRequestCreatedSender({
    this.name,
    this.imageUrl,
    required this.verified
  });

  final String? name;
  final String? imageUrl;
  final bool verified;
}

class SCNotificationDataFriendRequestAccepted {

  const SCNotificationDataFriendRequestAccepted({
    required this.created,
    this.sender,
    this.text
  });

  final DateTime created;
  final SCNotificationDataFriendRequestAcceptedSender? sender;
  final String? text;
}

class SCNotificationDataFriendRequestAcceptedSender {

  const SCNotificationDataFriendRequestAcceptedSender({
    this.name,
    this.imageUrl,
    required this.verified
  });

  final String? name;
  final String? imageUrl;
  final bool verified;
}

class SCNotificationDataFriendRequestDenied {

  const SCNotificationDataFriendRequestDenied({
    required this.created,
    this.sender,
    this.text
  });

  final DateTime created;
  final SCNotificationDataFriendRequestDeniedSender? sender;
  final String? text;
}

class SCNotificationDataFriendRequestDeniedSender {

  const SCNotificationDataFriendRequestDeniedSender({
    this.name,
    this.imageUrl,
    required this.verified
  });

  final String? name;
  final String? imageUrl;
  final bool verified;
}

// TODO: Was ist wenn verlinkte Personen also companions gar nicht teilnehmen wollen?