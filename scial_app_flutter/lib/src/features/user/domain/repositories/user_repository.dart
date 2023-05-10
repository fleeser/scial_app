import 'package:scial_app_client/scial_app_client.dart';

abstract class UserRepository {
  Future<PublicUser> read(int userId);
  Future<List<PublicUserFriendship>> friendships(int userId);
  Future<List<PublicUserRating>> ratings(int userId);
  Future<void> removeFriendship(int friendshipId);
  Future<void> answerFriendRequest(int friendRequestId, bool answer);
  Future<void> takeBackFriendRequest(int friendRequestId);
  Future<void> createFriendRequest(int userId, String? text);
  Future<void> updateUser(String? name, bool? isPrivate, bool updateName, bool updateIsPrivate);
}