import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class FriendRequestHandler {

  static Future<FriendRequestCreateResponse> create(Session session, int userId, String? text) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return FriendRequestCreateResponse(
        success: false,
        code: FriendRequestCreateResponseCode.notAuthenticated
      );
    }

    FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => ((t.sender.equals(authUserId) & t.receiver.equals(userId)) | (t.sender.equals(userId) & t.receiver.equals(authUserId))) & t.status.equals(FriendRequestStatus.pending));

    if (friendRequestRow != null) {
      return FriendRequestCreateResponse(
        success: false,
        code: FriendRequestCreateResponseCode.friendRequestAlreadyExists
      );
    }

    FriendRequest friendRequest = FriendRequest(
      sender: authUserId, 
      receiver: userId, 
      status: FriendRequestStatus.pending, 
      created: DateTime.now(), 
      text: text
    );

    await FriendRequest.insert(session, friendRequest);

    Notification notification = Notification(
      created: DateTime.now(), 
      type: NotificationType.friendRequestCreated, 
      read: false, 
      ref: friendRequest.id!, 
      receiver: userId
    );

    await Notification.insert(session, notification);

    return FriendRequestCreateResponse(success: true);
  }

  static Future<FriendRequestAnswerResponse> answer(Session session, int friendRequestId, bool answer) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return FriendRequestAnswerResponse(
        success: false,
        code: FriendRequestAnswerResponseCode.notAuthenticated
      );
    }

    FriendRequest? friendRequestRow = await FriendRequest.findById(session, friendRequestId);

    if (friendRequestRow == null) {
      return FriendRequestAnswerResponse(
        success: false,
        code: FriendRequestAnswerResponseCode.friendRequestNotFound
      );
    }

    if (friendRequestRow.status != FriendRequestStatus.pending) {
      return FriendRequestAnswerResponse(
        success: false,
        code: FriendRequestAnswerResponseCode.friendRequestAlreadyAnswered
      );
    }

    friendRequestRow.status = answer
      ? FriendRequestStatus.accepted
      : FriendRequestStatus.denied;

    await FriendRequest.update(session, friendRequestRow);

    if (answer) {
      List<int> users = [ friendRequestRow.sender, friendRequestRow.receiver ]..sort();

      Friendship friendship = Friendship(
        users: users, 
        created: DateTime.now(), 
        badges: []
      );

      await Friendship.insert(session, friendship);
    }

    Notification notification = Notification(
      created: DateTime.now(), 
      type: answer
        ? NotificationType.friendRequestAccepted
        : NotificationType.friendRequestDenied, 
      read: false, 
      ref: friendRequestId, 
      receiver: friendRequestRow.sender
    );

    await Notification.insert(session, notification);

    return FriendRequestAnswerResponse(success: true);
  }

  static Future<FriendRequestTakeBackResponse> takeBack(Session session, int friendRequestId) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return FriendRequestTakeBackResponse(
        success: false,
        code: FriendRequestTakeBackResponseCode.notAuthenticated
      );
    }

    FriendRequest? friendRequestRow = await FriendRequest.findById(session, friendRequestId);

    if (friendRequestRow == null) {
      return FriendRequestTakeBackResponse(
        success: false,
        code: FriendRequestTakeBackResponseCode.friendRequestNotFound
      );
    }

    if (friendRequestRow.status != FriendRequestStatus.pending) {
      return FriendRequestTakeBackResponse(
        success: false,
        code: FriendRequestTakeBackResponseCode.friendRequestAlreadyAnswered
      );
    }

    await FriendRequest.deleteRow(session, friendRequestRow);

    await Notification.delete(session, where: (t) => t.ref.equals(friendRequestId) & t.type.equals(NotificationType.friendRequestCreated));

    return FriendRequestTakeBackResponse(success: true);
  }
}