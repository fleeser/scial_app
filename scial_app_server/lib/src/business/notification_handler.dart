import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class NotificationHandler {

  static Future<NotificationReadResponse> read(Session session) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return NotificationReadResponse(
        success: false,
        code: NotificationReadResponseCode.notAuthenticated
      );
    }

    List<Notification> notificationRows = await Notification.find(session, where: (t) => t.receiver.equals(authUserId));

    List<PublicNotification> notifications = [];
    for (Notification notificationRow in notificationRows) {

      dynamic data;

      if (notificationRow.type == NotificationType.friendRequestCreated) {

        PublicNotificationFriendRequestCreatedFriendRequest? friendRequest;

        FriendRequest? friendRequestRow = await FriendRequest.findById(session, notificationRow.ref);

        if (friendRequestRow != null) {

          PublicNotificationFriendRequestCreatedFriendRequestSender? sender;
          
          User? senderRow = await User.findById(session, friendRequestRow.sender);

          if (senderRow != null) {
            sender = PublicNotificationFriendRequestCreatedFriendRequestSender(
              id: senderRow.id!,
              name: senderRow.name,
              imageUrl: senderRow.imageUrl,
              verified: senderRow.verified
            );
          }

          friendRequest = PublicNotificationFriendRequestCreatedFriendRequest(
            id: friendRequestRow.id!,
            created: friendRequestRow.created,
            text: friendRequestRow.text,
            status: friendRequestRow.status,
            sender: sender
          );
        }

        data = PublicNotificationFriendRequestCreated(
          friendRequest: friendRequest
        );
      } else if (notificationRow.type == NotificationType.friendRequestAccepted) {
        PublicNotificationFriendRequestAcceptedSender? sender;

        FriendRequest? friendRequestRow = await FriendRequest.findById(session, notificationRow.ref);

        if (friendRequestRow != null) {
          User? senderRow = await User.findById(session, friendRequestRow.receiver);

          if (senderRow != null) {
            sender = PublicNotificationFriendRequestAcceptedSender(
              id: senderRow.id!,
              name: senderRow.name,
              imageUrl: senderRow.imageUrl,
              verified: senderRow.verified
            );
          }
        }

        data = PublicNotificationFriendRequestAccepted(
          sender: sender
        );
      } else if (notificationRow.type == NotificationType.friendRequestDenied) {
        PublicNotificationFriendRequestDeniedSender? sender;

        FriendRequest? friendRequestRow = await FriendRequest.findById(session, notificationRow.ref);

        if (friendRequestRow != null) {
          User? senderRow = await User.findById(session, friendRequestRow.receiver);

          if (senderRow != null) {
            sender = PublicNotificationFriendRequestDeniedSender(
              id: senderRow.id!,
              name: senderRow.name,
              imageUrl: senderRow.imageUrl,
              verified: senderRow.verified
            );
          }
        }

        data = PublicNotificationFriendRequestDenied(
          sender: sender
        );
      }

      PublicNotification notification = PublicNotification(
        id: notificationRow.id!, 
        type: notificationRow.type, 
        created: notificationRow.created,
        data: data
      );

      notifications.add(notification);
    }

    return NotificationReadResponse(
      success: true,
      notifications: notifications
    );
  }

  static Future<NotificationSetReadResponse> setRead(Session session, int notificationId) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return NotificationSetReadResponse(
        success: false,
        code: NotificationSetReadResponseCode.notAuthenticated
      );
    }

    Notification? notificationRow = await Notification.findById(session, notificationId);

    if (notificationRow == null) {
      return NotificationSetReadResponse(
        success: false,
        code: NotificationSetReadResponseCode.notificationNotFound
      );
    }

    if (notificationRow.read) {
      return NotificationSetReadResponse(success: true);
    }

    notificationRow.read = true;

    await Notification.update(session, notificationRow);

    return NotificationSetReadResponse(success: true);
  }

  static Future<NotificationSetAllReadResponse> setAllRead(Session session) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return NotificationSetAllReadResponse(
        success: false,
        code: NotificationSetAllReadResponseCode.notAuthenticated
      );
    }

    List<Notification> notificationRows = await Notification.find(session, where: (t) => t.receiver.equals(authUserId) & t.read.equals(false));

    for (Notification notificationRow in notificationRows) {
      notificationRow.read = true;
      await Notification.update(session, notificationRow);
    }

    return NotificationSetAllReadResponse(success: true);
  }
}