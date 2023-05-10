import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/data/data_sources/user_data_source.dart';
import 'package:scial_app_flutter/src/features/user/data/data_sources/user_data_source_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';

part 'user_repository_impl.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  final dataSource = ref.read(userDataSourceProvider);
  final userRepository = UserRepositoryImpl(dataSource);
  return userRepository;
}

class UserRepositoryImpl implements UserRepository {

  const UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;

  @override
  Future<PublicUser> read(int userId) async {
    return await dataSource.read(userId);
  }

  @override
  Future<List<PublicUserFriendship>> friendships(int userId) async {
    return await dataSource.friendships(userId);
  }

  @override
  Future<List<PublicUserRating>> ratings(int userId) async {
    return await dataSource.ratings(userId);
  }

  @override
  Future<void> removeFriendship(int friendshipId) async {
    return await dataSource.removeFriendship(friendshipId);
  }

  @override
  Future<void> answerFriendRequest(int friendRequestId, bool answer) async {
    return await dataSource.answerFriendRequest(friendRequestId, answer);
  }

  @override
  Future<void> takeBackFriendRequest(int friendRequestId) async {
    return await dataSource.takeBackFriendRequest(friendRequestId);
  }

  @override
  Future<void> createFriendRequest(int userId, String? text) async {
    return await dataSource.createFriendRequest(userId, text);
  }

  @override
  Future<void> updateUser(String? name, bool? isPrivate, bool updateName, bool updateIsPrivate) async {
    return await dataSource.updateUser(name, isPrivate, updateName, updateIsPrivate);
  }
}