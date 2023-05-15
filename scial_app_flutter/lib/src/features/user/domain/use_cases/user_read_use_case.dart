import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_read_use_case.g.dart';

@riverpod
UserReadUseCase userReadUseCase(UserReadUseCaseRef ref) => UserReadUseCase(ref.read(userRepositoryProvider));

class UserReadUseCase implements FutureUseCase<void, UserReadUseCaseParams> {

  const UserReadUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<PublicUser> call(UserReadUseCaseParams params) async {
    return await repository.read(params.userId);
  }
}

class UserReadUseCaseParams extends Equatable {

  const UserReadUseCaseParams({ required this.userId });

  final int userId;
  
  @override
  List<Object?> get props => [ userId ];
}