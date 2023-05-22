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

      late dynamic data;

      if (notificationRow.type == NotificationType.friendRequestCreated) {

        PublicNotificationDataFriendRequestCreated? notificationDataFriendRequestCreated;

        FriendRequest? friendRequestRow = await FriendRequest.findById(session, notificationRow.ref);

        if (friendRequestRow != null) {

          PublicNotificationDataFriendRequestCreatedSender? sender;
          
          User? senderRow = await User.findById(session, friendRequestRow.sender);

          if (senderRow != null) {
            sender = PublicNotificationDataFriendRequestCreatedSender(
              id: senderRow.id!,
              name: senderRow.name,
              imageUrl: senderRow.imageUrl,
              verified: senderRow.verified
            );
          }

          notificationDataFriendRequestCreated = PublicNotificationDataFriendRequestCreated(
            created: friendRequestRow.created,
            sender: sender,
            text: friendRequestRow.text
          );

          data = notificationDataFriendRequestCreated;
        }
      } else if (notificationRow.type == NotificationType.friendRequestAccepted) {

        PublicNotificationDataFriendRequestCreated? notificationDataFriendRequestCreated;

        FriendRequest? friendRequestRow = await FriendRequest.findById(session, notificationRow.ref);

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
        read: notificationRow.read,
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