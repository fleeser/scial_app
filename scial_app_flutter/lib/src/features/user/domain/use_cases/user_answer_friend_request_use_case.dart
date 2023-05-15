import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_answer_friend_request_use_case.g.dart';

@riverpod
UserAnswerFriendRequestUseCase userAnswerFriendRequestUseCase(UserAnswerFriendRequestUseCaseRef ref) => UserAnswerFriendRequestUseCase(ref.read(userRepositoryProvider));

class UserAnswerFriendRequestUseCase implements FutureUseCase<void, UserAnswerFriendRequestUseCaseParams> {

  const UserAnswerFriendRequestUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<void> call(UserAnswerFriendRequestUseCaseParams params) async {
    return await repository.answerFriendRequest(params.friendRequestId, params.answer);
  }
}

class UserAnswerFriendRequestUseCaseParams extends Equatable {

  const UserAnswerFriendRequestUseCaseParams({ 
    required this.friendRequestId,
    required this.answer
  });

  final int friendRequestId;
  final bool answer;
  
  @override
  List<Object?> get props => [ friendRequestId, answer ];
}