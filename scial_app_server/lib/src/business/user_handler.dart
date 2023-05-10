import 'package:scial_app_server/src/generated/protocol.dart';
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
          created: friendshipRow.created,
          badges: friendshipRow.badges
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

  static Future<UserUpdateResponse> update(Session session, String? name, bool? isPrivate, bool updateName, bool updateIsPrivate) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserUpdateResponse(
        success: false,
        code: UserUpdateResponseCode.notAuthenticated
      );
    }

    User? userRow = await User.findById(session, authUserId);

    if (userRow == null) {
      return UserUpdateResponse(
        success: false,
        code: UserUpdateResponseCode.userNotFound
      );
    }

    if (updateName) {
      userRow.name = name;
    }

    if (updateIsPrivate) {
      userRow.private = isPrivate!;
    }

    await User.update(session, userRow);

    // TODO transaction

    return UserUpdateResponse(success: true);
  }

  static Future<UserFriendshipsResponse> friendships(Session session, int userId, int? limit, int? offset) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserFriendshipsResponse(
        success: false,
        code: UserFriendshipsResponseCode.notAuthenticated
      );
    }

    User? userRow = await User.findById(session, userId);

    if (userRow == null) {
      return UserFriendshipsResponse(
        success: false,
        code: UserFriendshipsResponseCode.userNotFound
      );
    }

    if (userId != authUserId && userRow.private) {

      List<int> users = [ userId, authUserId ]..sort();
      Friendship? friendshipRow = await Friendship.findSingleRow(session, where: (t) => Expression("${t.users.columnName}::json::text = '$users'"));

      if (friendshipRow == null) {
        FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => (t.sender.equals(userId) & t.receiver.equals(authUserId)) & t.status.equals(FriendRequestStatus.pending));

        if (friendRequestRow == null) {
          return UserFriendshipsResponse(
            success: false,
            code: UserFriendshipsResponseCode.isPrivate
          );
        }
      }
    }

    List<PublicUserFriendship> friendships = [];

    List<Friendship> friendshipRows = await Friendship.find(session, where: (t) => Expression("${t.users.columnName}::json::text LIKE '[$userId,%' OR ${t.users.columnName}::json::text LIKE '%,$userId]'"), limit: limit, offset: offset);

    for (Friendship friendshipRow in friendshipRows) {
      User? friendshipUserRow = await User.findById(session, friendshipRow.users.firstWhere((element) => element != userId));

      PublicUserFriendshipUser? friendshipUser;
      if (friendshipUserRow != null) {
        friendshipUser = PublicUserFriendshipUser(
          id: friendshipUserRow.id!, 
          name: friendshipUserRow.name,
          imageUrl: friendshipUserRow.imageUrl,
          verified: friendshipUserRow.verified
        );
      }

      PublicUserFriendship friendship = PublicUserFriendship(
        id: friendshipRow.id!,
        created: friendshipRow.created, 
        user: friendshipUser,
        badges: friendshipRow.badges
      );

      friendships.add(friendship);
    }

    return UserFriendshipsResponse(
      success: true,
      friendships: friendships
    );
  }

  static Future<UserRatingsResponse> ratings(Session session, int userId, int? limit, int? offset) async {
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
          return UserRatingsResponse(
            success: false,
            code: UserRatingsResponseCode.isPrivate
          );
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