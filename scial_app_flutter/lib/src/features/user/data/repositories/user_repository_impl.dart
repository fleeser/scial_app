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
  Future<List<PublicUserRating>?> ratings(int userId) async {
    return await dataSource.ratings(userId);
  }
}