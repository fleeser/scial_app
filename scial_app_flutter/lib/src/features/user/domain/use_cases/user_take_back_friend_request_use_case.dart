import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_take_back_friend_request_use_case.g.dart';

@riverpod
UserTakeBackFriendRequestUseCase userTakeBackFriendRequestUseCase(UserTakeBackFriendRequestUseCaseRef ref) => UserTakeBackFriendRequestUseCase(ref.read(userRepositoryProvider));

class UserTakeBackFriendRequestUseCase implements FutureUseCase<void, UserTakeBackFriendRequestUseCaseParams> {

  const UserTakeBackFriendRequestUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<void> call(UserTakeBackFriendRequestUseCaseParams params) async {
    return await repository.takeBackFriendRequest(params.friendRequestId);
  }
}

class UserTakeBackFriendRequestUseCaseParams extends Equatable {

  const UserTakeBackFriendRequestUseCaseParams({ required this.friendRequestId });

  final int friendRequestId;
  
  @override
  List<Object?> get props => [ friendRequestId ];
}