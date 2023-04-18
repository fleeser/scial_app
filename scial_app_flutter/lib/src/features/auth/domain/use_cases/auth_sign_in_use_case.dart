import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scial_app_flutter/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'auth_sign_in_use_case.g.dart';

@riverpod
AuthSignInUseCase authSignInUseCase(AuthSignInUseCaseRef ref) => AuthSignInUseCase(ref.read(authRepositoryProvider));

class AuthSignInUseCase implements FutureUseCase<void, AuthSignInUseCaseParams> {

  const AuthSignInUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(AuthSignInUseCaseParams params) async {
    return await repository.signIn(params.email, params.password);
  }
}

class AuthSignInUseCaseParams extends Equatable {

  const AuthSignInUseCaseParams({
    required this.email,
    required this.password
  });

  final String email;
  final String password;
  
  @override
  List<Object?> get props => [ email, password ];
}