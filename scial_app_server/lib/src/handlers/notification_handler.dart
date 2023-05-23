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

      dynamic data = await _fetchNotificationData(session, notificationRow);

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

  static Future<dynamic> _fetchNotificationData(Session session, Notification notificationRow) async {
    switch (notificationRow.type) {
      case NotificationType.friendRequestCreated: return await _fetchNotificationDataFriendRequestCreated(session, notificationRow.ref);
      case NotificationType.friendRequestAccepted: return await _fetchNotificationDataFriendRequestAccepted(session, notificationRow.ref);
      default: return await _fetchNotificationDataFriendRequestDenied(session, notificationRow.ref);
    }
  }

  static Future<PublicNotificationDataFriendRequestCreated?> _fetchNotificationDataFriendRequestCreated(Session session, int friendRequestId) async {
    FriendRequest? friendRequestRow = await FriendRequest.findById(session, friendRequestId);
    
    if (friendRequestRow == null) return null;

    PublicNotificationDataFriendRequestCreated notificationDataFriendRequestCreated = PublicNotificationDataFriendRequestCreated(
      id: friendRequestRow.id!,
      created: friendRequestRow.created,
      status: friendRequestRow.status,
      text: friendRequestRow.text
    );

    User? senderRow = await User.findById(session, friendRequestRow.sender);

    if (senderRow == null) return notificationDataFriendRequestCreated;

    PublicNotificationDataFriendRequestCreatedSender sender = PublicNotificationDataFriendRequestCreatedSender(
      id: senderRow.id!,
      name: senderRow.name,
      imageUrl: senderRow.imageUrl,
      verified: senderRow.verified
    );

    notificationDataFriendRequestCreated.sender = sender;

    return notificationDataFriendRequestCreated;
  }

  static Future<PublicNotificationDataFriendRequestAccepted?> _fetchNotificationDataFriendRequestAccepted(Session session, int friendRequestId) async {
    FriendRequest? friendRequestRow = await FriendRequest.findById(session, friendRequestId);
    
    if (friendRequestRow == null) return null;

    PublicNotificationDataFriendRequestAccepted notificationDataFriendRequestAccepted = PublicNotificationDataFriendRequestAccepted(
      id: friendRequestRow.id!,
      created: friendRequestRow.created,
      text: friendRequestRow.text
    );

    User? senderRow = await User.findById(session, friendRequestRow.sender);

    if (senderRow == null) return notificationDataFriendRequestAccepted;

    PublicNotificationDataFriendRequestAcceptedSender sender = PublicNotificationDataFriendRequestAcceptedSender(
      id: senderRow.id!,
      name: senderRow.name,
      imageUrl: senderRow.imageUrl,
      verified: senderRow.verified
    );

    notificationDataFriendRequestAccepted.sender = sender;

    return notificationDataFriendRequestAccepted;
  }

  static Future<PublicNotificationDataFriendRequestDenied?> _fetchNotificationDataFriendRequestDenied(Session session, int friendRequestId) async {
    FriendRequest? friendRequestRow = await FriendRequest.findById(session, friendRequestId);
    
    if (friendRequestRow == null) return null;

    PublicNotificationDataFriendRequestDenied notificationDataFriendRequestDenied = PublicNotificationDataFriendRequestDenied(
      id: friendRequestRow.id!,
      created: friendRequestRow.created,
      text: friendRequestRow.text
    );

    User? senderRow = await User.findById(session, friendRequestRow.sender);

    if (senderRow == null) return notificationDataFriendRequestDenied;

    PublicNotificationDataFriendRequestDeniedSender sender = PublicNotificationDataFriendRequestDeniedSender(
      id: senderRow.id!,
      name: senderRow.name,
      imageUrl: senderRow.imageUrl,
      verified: senderRow.verified
    );

    notificationDataFriendRequestDenied.sender = sender;

    return notificationDataFriendRequestDenied;
  }
}