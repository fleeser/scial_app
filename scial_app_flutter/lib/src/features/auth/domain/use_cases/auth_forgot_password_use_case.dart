import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scial_app_flutter/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'auth_forgot_password_use_case.g.dart';

@riverpod
AuthForgotPasswordUseCase authForgotPasswordUseCase(AuthForgotPasswordUseCaseRef ref) => AuthForgotPasswordUseCase(ref.read(authRepositoryProvider));

class AuthForgotPasswordUseCase implements FutureUseCase<void, AuthForgotPasswordUseCaseParams> {

  const AuthForgotPasswordUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(AuthForgotPasswordUseCaseParams params) async {
    return await repository.forgotPassword(params.email);
  }
}

class AuthForgotPasswordUseCaseParams extends Equatable {

  const AuthForgotPasswordUseCaseParams({ required this.email });

  final String email;
  
  @override
  List<Object?> get props => [ email ];
}