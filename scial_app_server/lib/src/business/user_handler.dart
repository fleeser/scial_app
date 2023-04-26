import 'package:scial_app_server/src/generated/friend_request/enum/friend_request_status.dart';
import 'package:scial_app_server/src/generated/friend_request/table/friend_request.dart';
import 'package:scial_app_server/src/generated/friendship/table/friendship.dart';
import 'package:scial_app_server/src/generated/rating/table/rating.dart';
import 'package:scial_app_server/src/generated/user/model/public_user.dart';
import 'package:scial_app_server/src/generated/user/model/public_user_friend_request.dart';
import 'package:scial_app_server/src/generated/user/model/public_user_friendship_details.dart';
import 'package:scial_app_server/src/generated/user/model/public_user_rating.dart';
import 'package:scial_app_server/src/generated/user/model/public_user_rating_user.dart';
import 'package:scial_app_server/src/generated/user/response/user_ratings_response.dart';
import 'package:scial_app_server/src/generated/user/response/user_ratings_response_code.dart';
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

  static Future<UserRatingsResponse> ratings(Session session, int userId, { int? limit, int? offset }) async {
    
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserRatingsResponse(
        success: false,
        code: UserRatingsResponseCode.notAuthenticated
      );
    }

    User? userRow = await User.findById(session, userId);

    if (userRow == null) {
      return UserRatingsResponse(
        success: false,
        code: UserRatingsResponseCode.userNotFound
      );
    }

    if (userId != authUserId && userRow.private) {

      List<int> users = [ userId, authUserId ]..sort();
      Friendship? friendshipRow = await Friendship.findSingleRow(session, where: (t) => Expression("${t.users.columnName}::json::text = '$users'"));

      if (friendshipRow == null) {
        FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => (t.sender.equals(userId) & t.receiver.equals(authUserId)) & t.status.equals(FriendRequestStatus.pending));

        if (friendRequestRow == null) {
          return UserRatingsResponse(success: true);
        }
      }
    }

    List<PublicUserRating> ratings = [];

    List<Rating> ratingRows = await Rating.find(session, where: (t) => t.receiver.equals(userId), limit: limit, offset: offset);

    for (Rating ratingRow in ratingRows) {
      User? ratingUserRow = await User.findById(session, ratingRow.sender);

      PublicUserRatingUser? ratingUser;
      if (ratingUserRow != null) {
        ratingUser = PublicUserRatingUser(
          id: ratingUserRow.id!, 
          name: ratingUserRow.name,
          imageUrl: ratingUserRow.imageUrl,
          verified: ratingUserRow.verified
        );
      }

      PublicUserRating rating = PublicUserRating(
        id: ratingRow.id!, 
        type: ratingRow.type, 
        created: ratingRow.created, 
        sender: ratingUser,
        stars: ratingRow.stars,
        text: ratingRow.text
      );

      ratings.add(rating);
    }

    return UserRatingsResponse(
      success: true,
      ratings: ratings
    );
  }
}