import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_update_use_case.g.dart';

@riverpod
UserUpdateUseCase userUpdateUseCase(UserUpdateUseCaseRef ref) => UserUpdateUseCase(ref.read(userRepositoryProvider));

class UserUpdateUseCase implements FutureUseCase<void, UserUpdateUseCaseParams> {

  const UserUpdateUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<void> call(UserUpdateUseCaseParams params) async {
    return await repository.updateUser(params.name, params.isPrivate);
  }
}

class UserUpdateUseCaseParams extends Equatable {

  const UserUpdateUseCaseParams({ 
    this.name,
    this.isPrivate
  });

  final String? name;
  final bool? isPrivate;
  
  @override
  List<Object?> get props => [ name, isPrivate ];
}