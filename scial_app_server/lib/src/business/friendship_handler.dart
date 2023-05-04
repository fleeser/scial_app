import 'package:scial_app_server/src/generated/friendship/response/friendship_remove_response.dart';
import 'package:scial_app_server/src/generated/friendship/response/friendship_remove_response_code.dart';
import 'package:scial_app_server/src/generated/friendship/table/friendship.dart';
import 'package:serverpod/serverpod.dart';

class FriendshipHandler {

  static Future<FriendshipRemoveResponse> remove(Session session, int friendshipId) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return FriendshipRemoveResponse(
        success: false,
        code: FriendshipRemoveResponseCode.notAuthenticated
      );
    }

    Friendship? friendshipRow = await Friendship.findById(session, friendshipId);

    if (friendshipRow == null) {
      return FriendshipRemoveResponse(
        success: false,
        code: FriendshipRemoveResponseCode.friendshipNotFound
      );
    }

    await Friendship.deleteRow(session, friendshipRow);

    return FriendshipRemoveResponse(success: true);
  }
}