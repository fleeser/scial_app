import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/search_user/data/repositories/search_user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/search_user/domain/repositories/search_user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'search_user_search_use_case.g.dart';

@riverpod
SearchUserSearchUseCase searchUserSearchUseCase(SearchUserSearchUseCaseRef ref) => SearchUserSearchUseCase(ref.read(searchUserRepositoryProvider));

class SearchUserSearchUseCase implements FutureUseCase<void, SearchUserSearchUseCaseParams> {

  const SearchUserSearchUseCase(this.repository);

  final SearchUserRepository repository;

  @override
  Future<List<PublicUserSearchUser>> call(SearchUserSearchUseCaseParams params) async {
    return await repository.search(params.searchText);
  }
}

class SearchUserSearchUseCaseParams extends Equatable {

  const SearchUserSearchUseCaseParams({ 
    required this.searchText
  });

  final String searchText;
  
  @override
  List<Object?> get props => [ searchText ];
}