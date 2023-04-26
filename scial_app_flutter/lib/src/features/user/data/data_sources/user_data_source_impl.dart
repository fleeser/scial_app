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
    UserReadResponse response = await Future.delayed(const Duration(seconds: 5), () async => await client.user.read(userId));

    if (response.success) return response.user!;
    
    switch (response.code) {
      case UserReadResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserReadResponseCode.userNotFound: throw const ServerException.userReadUserNotFound();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<List<PublicUserRating>?> ratings(int userId) async {
    UserRatingsResponse response = await Future.delayed(const Duration(seconds: 5), () async => await client.user.ratings(userId));

    if (response.success) return response.ratings;
    
    switch (response.code) {
      case UserRatingsResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserRatingsResponseCode.userNotFound: throw const ServerException.userRatingsUserNotFound();
      default: throw const ServerException.unknownError();
    }
  }
}