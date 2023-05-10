import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_remove_friendship_use_case.g.dart';

@riverpod
UserRemoveFriendshipUseCase userRemoveFriendshipUseCase(UserRemoveFriendshipUseCaseRef ref) => UserRemoveFriendshipUseCase(ref.read(userRepositoryProvider));

class UserRemoveFriendshipUseCase implements FutureUseCase<void, UserRemoveFriendshipUseCaseParams> {

  const UserRemoveFriendshipUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<void> call(UserRemoveFriendshipUseCaseParams params) async {
    return await repository.removeFriendship(params.friendshipId);
  }
}

class UserRemoveFriendshipUseCaseParams extends Equatable {

  const UserRemoveFriendshipUseCaseParams({ required this.friendshipId });

  final int friendshipId;
  
  @override
  List<Object?> get props => [ friendshipId ];
}