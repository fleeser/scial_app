import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_ratings_use_case.g.dart';

@riverpod
UserRatingsUseCase userRatingsUseCase(UserRatingsUseCaseRef ref) => UserRatingsUseCase(ref.read(userRepositoryProvider));

class UserRatingsUseCase implements FutureUseCase<void, UserRatingsUseCaseParams> {

  const UserRatingsUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<List<PublicUserRating>> call(UserRatingsUseCaseParams params) async {
    return await repository.ratings(params.userId);
  }
}

class UserRatingsUseCaseParams extends Equatable {

  const UserRatingsUseCaseParams({ required this.userId });

  final int userId;
  
  @override
  List<Object?> get props => [ userId ];
}