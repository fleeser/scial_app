import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/exceptions/app_exception.dart';
import 'package:scial_app_flutter/src/features/search_user/data/data_sources/search_user_data_source.dart';
import 'package:scial_app_flutter/src/features/search_user/data/data_sources/search_user_data_source_impl.dart';
import 'package:scial_app_flutter/src/features/search_user/domain/repositories/search_user_repository.dart';
import 'package:scial_app_shared/scial_app_shared.dart';

part 'search_user_repository_impl.g.dart';

@Riverpod(keepAlive: true)
SearchUserRepository searchUserRepository(SearchUserRepositoryRef ref) {
  final dataSource = ref.read(searchUserDataSourceProvider);
  final searchUserRepository = SearchUserRepositoryImpl(dataSource);
  return searchUserRepository;
}

class SearchUserRepositoryImpl implements SearchUserRepository {

  const SearchUserRepositoryImpl(this.dataSource);

  final SearchUserDataSource dataSource;

  @override
  Future<List<PublicUserSearchUser>> search(String searchText) async {
    searchText = searchText.trim();

    if (searchText.startsWith('#')) {
      searchText = searchText.toUpperCase();
      bool uniqueCodeIsValid = Validator.validateUniqueCode(searchText.substring(1));
      if (!uniqueCodeIsValid) throw const AppException.searchUserSearchInvalidUniqueCode();
    }

    return await dataSource.search(searchText);
  }
}