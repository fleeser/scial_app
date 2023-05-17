import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/main.dart';
import 'package:scial_app_flutter/src/exceptions/server_exception.dart';
import 'package:scial_app_flutter/src/features/user/data/data_sources/user_data_source.dart';

part 'user_data_source_impl.g.dart';

@riverpod
UserDataSource userDataSource(UserDataSourceRef ref) => UserDataSourceImpl();

class UserDataSourceImpl implements UserDataSource {

  @override
  Future<PublicUser> read(int userId) async {
    UserReadResponse response = await client.user.read(userId);

    if (response.success) return response.user!;
    
    switch (response.code) {
      case UserReadResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserReadResponseCode.userNotFound: throw const ServerException.userReadUserNotFound();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<List<PublicEvent>> events(int userId, double? lat, double? long) async {
    UserEventsResponse response = await client.user.events(userId, lat, long);

    if (response.success) return response.events!;

    switch (response.code) {
      case UserEventsResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserEventsResponseCode.userNotFound: throw const ServerException.userEventsUserNotFound();
      case UserEventsResponseCode.isPrivate: throw const ServerException.userEventsIsPrivate();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<List<PublicUserFriendship>> friendships(int userId) async {
    UserFriendshipsResponse response = await client.user.friendships(userId);

    if (response.success) return response.friendships!;
    
    switch (response.code) {
      case UserFriendshipsResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserFriendshipsResponseCode.userNotFound: throw const ServerException.userFriendshipsUserNotFound();
      case UserFriendshipsResponseCode.isPrivate: throw const ServerException.userFriendshipsIsPrivate();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<List<PublicUserRating>> ratings(int userId) async {
    UserRatingsResponse response = await client.user.ratings(userId);

    if (response.success) return response.ratings!;
    
    switch (response.code) {
      case UserRatingsResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserRatingsResponseCode.userNotFound: throw const ServerException.userRatingsUserNotFound();
      case UserRatingsResponseCode.isPrivate: throw const ServerException.userRatingsIsPrivate();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> removeFriendship(int friendshipId) async {
    FriendshipRemoveResponse response = await client.friendship.remove(friendshipId);

    if (response.success) return;

    switch (response.code) {
      case FriendshipRemoveResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case FriendshipRemoveResponseCode.friendshipNotFound: throw const ServerException.userRemoveFriendshipFriendshipNotFound();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> answerFriendRequest(int friendRequestId, bool answer) async {
    FriendRequestAnswerResponse response = await client.friendRequest.answer(friendRequestId, answer);

    if (response.success) return;

    switch (response.code) {
      case FriendRequestAnswerResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case FriendRequestAnswerResponseCode.friendRequestNotFound: throw const ServerException.userAnswerFriendRequestFriendRequestNotFound();
      case FriendRequestAnswerResponseCode.friendRequestAlreadyAnswered: throw const ServerException.userAnswerFriendRequestFriendRequestAlreadyAnswered();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> takeBackFriendRequest(int friendRequestId) async {
    FriendRequestTakeBackResponse response = await client.friendRequest.takeBack(friendRequestId);

    if (response.success) return;

    switch (response.code) {
      case FriendRequestTakeBackResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case FriendRequestTakeBackResponseCode.friendRequestNotFound: throw const ServerException.userTakeBackFriendRequestFriendRequestNotFound();
      case FriendRequestTakeBackResponseCode.friendRequestAlreadyAnswered: throw const ServerException.userTakeBackFriendRequestFriendRequestAlreadyAnswered();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> createFriendRequest(int userId, String? text) async {
    FriendRequestCreateResponse response = await client.friendRequest.create(userId, text);

    if (response.success) return;

    switch (response.code) {
      case FriendRequestCreateResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case FriendRequestCreateResponseCode.friendRequestAlreadyExists: throw const ServerException.userCreateFriendRequestFriendRequestAlreadyExists();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> updateUser(String? name, bool? isPrivate, bool updateName, bool updateIsPrivate) async {
    UserUpdateResponse response = await client.user.update(name: name, isPrivate: isPrivate, updateName: updateName, updateIsPrivate: updateIsPrivate);

    if (response.success) return;

    switch (response.code) {
      case UserUpdateResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserUpdateResponseCode.userNotFound: throw const ServerException.userUpdateUserNotFound();
      default: throw const ServerException.unknownError();
    }
  }
}