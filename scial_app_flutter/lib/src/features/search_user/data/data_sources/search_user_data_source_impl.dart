import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/main.dart';
import 'package:scial_app_flutter/src/exceptions/server_exception.dart';
import 'package:scial_app_flutter/src/features/search_user/data/data_sources/search_user_data_source.dart';

part 'search_user_data_source_impl.g.dart';

@riverpod
SearchUserDataSource searchUserDataSource(SearchUserDataSourceRef ref) => SearchUserDataSourceImpl();

class SearchUserDataSourceImpl implements SearchUserDataSource {

  @override
  Future<List<PublicUserSearchUser>> search(String searchText) async {
    UserSearchResponse response = await client.user.search(searchText);

    if (response.success) return response.users!;
    
    switch (response.code) {
      case UserSearchResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case UserSearchResponseCode.invalidUniqueCode: throw const ServerException.searchUserSearchInvalidUniqueCode();
      case UserSearchResponseCode.userNotFound: throw const ServerException.searchUserSearchUserNotFound();
      default: throw const ServerException.unknownError();
    }
  }
}