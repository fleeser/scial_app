import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scial_app_flutter/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'auth_sign_up_use_case.g.dart';

@riverpod
AuthSignUpUseCase authSignUpUseCase(AuthSignUpUseCaseRef ref) => AuthSignUpUseCase(ref.read(authRepositoryProvider));

class AuthSignUpUseCase implements FutureUseCase<void, AuthSignUpUseCaseParams> {

  const AuthSignUpUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(AuthSignUpUseCaseParams params) async {
    return await repository.signUp(params.email, params.password);
  }
}

class AuthSignUpUseCaseParams extends Equatable {

  const AuthSignUpUseCaseParams({
    required this.email,
    required this.password
  });

  final String email;
  final String password;
  
  @override
  List<Object?> get props => [ email, password ];
}