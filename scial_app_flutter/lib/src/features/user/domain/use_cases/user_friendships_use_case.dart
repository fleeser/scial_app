import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_friendships_use_case.g.dart';

@riverpod
UserFriendshipsUseCase userFriendshipsUseCase(UserFriendshipsUseCaseRef ref) => UserFriendshipsUseCase(ref.read(userRepositoryProvider));

class UserFriendshipsUseCase implements FutureUseCase<void, UserFriendshipsUseCaseParams> {

  const UserFriendshipsUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<List<PublicUserFriendship>> call(UserFriendshipsUseCaseParams params) async {
    return await repository.friendships(params.userId);
  }
}

class UserFriendshipsUseCaseParams extends Equatable {

  const UserFriendshipsUseCaseParams({ required this.userId });

  final int userId;
  
  @override
  List<Object?> get props => [ userId ];
}