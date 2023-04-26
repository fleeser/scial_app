import 'package:scial_app_server/src/generated/friend_request/enum/friend_request_status.dart';
import 'package:scial_app_server/src/generated/friend_request/table/friend_request.dart';
import 'package:scial_app_server/src/generated/friendship/table/friendship.dart';
import 'package:scial_app_server/src/generated/user/model/public_user.dart';
import 'package:scial_app_server/src/generated/user/model/public_user_friend_request.dart';
import 'package:scial_app_server/src/generated/user/model/public_user_friendship_details.dart';
import 'package:scial_app_server/src/generated/user/response/user_read_response.dart';
import 'package:scial_app_server/src/generated/user/response/user_read_response_code.dart';
import 'package:scial_app_server/src/generated/user/table/user.dart';
import 'package:serverpod/serverpod.dart';

class UserHandler {

  static Future<UserReadResponse> read(Session session, int userId) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserReadResponse(
        success: false,
        code: UserReadResponseCode.notAuthenticated
      );
    }
    
    User? userRow = await User.findById(session, userId);

    if (userRow == null) {
      return UserReadResponse(
        success: false,
        code: UserReadResponseCode.userNotFound
      );
    }

    PublicUser user = PublicUser(
      id: userRow.id!, 
      name: userRow.name, 
      imageUrl: userRow.imageUrl,
      verified: userRow.verified, 
      private: userRow.private, 
      badges: userRow.badges
    );

    if (userId != authUserId) {
      List<int> users = [ userId, authUserId ]..sort();
      Friendship? friendshipRow = await Friendship.findSingleRow(session, where: (t) => Expression("${t.users.columnName}::json::text = '$users'"));
      if (friendshipRow != null) {
        user.friendship = PublicUserFriendshipDetails(
          id: friendshipRow.id!, 
          created: friendshipRow.created
        );
      } else {
        FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => ((t.sender.equals(userId) & t.receiver.equals(authUserId)) | (t.sender.equals(authUserId) & t.receiver.equals(userId))) & t.status.equals(FriendRequestStatus.pending));

        if (friendRequestRow != null) {
          user.friendRequest = PublicUserFriendRequest(
            id: friendRequestRow.id!, 
            created: friendRequestRow.created, 
            text: friendRequestRow.text,
            isSender: authUserId == friendRequestRow.sender
          );
        }
      }
    }

    return UserReadResponse(
      success: true,
      user: user
    );
  }
}