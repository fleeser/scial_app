import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class FriendRequestHandler {

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

    return FriendRequestAnswerResponse(success: true);
  }
}