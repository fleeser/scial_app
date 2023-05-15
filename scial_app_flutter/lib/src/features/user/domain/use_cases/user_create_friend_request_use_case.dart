import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_create_friend_request_use_case.g.dart';

@riverpod
UserCreateFriendRequestUseCase userCreateFriendRequestUseCase(UserCreateFriendRequestUseCaseRef ref) => UserCreateFriendRequestUseCase(ref.read(userRepositoryProvider));

class UserCreateFriendRequestUseCase implements FutureUseCase<void, UserCreateFriendRequestUseCaseParams> {

  const UserCreateFriendRequestUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<void> call(UserCreateFriendRequestUseCaseParams params) async {
    return await repository.createFriendRequest(params.userId, params.text);
  }
}

class UserCreateFriendRequestUseCaseParams extends Equatable {

  const UserCreateFriendRequestUseCaseParams({ 
    required this.userId,
    this.text
  });

  final int userId;
  final String? text;
  
  @override
  List<Object?> get props => [ userId, text ];
}