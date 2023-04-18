import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scial_app_flutter/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'auth_forgot_password_verification_use_case.g.dart';

@riverpod
AuthForgotPasswordVerificationUseCase authForgotPasswordVerificationUseCase(AuthForgotPasswordVerificationUseCaseRef ref) => AuthForgotPasswordVerificationUseCase(ref.read(authRepositoryProvider));

class AuthForgotPasswordVerificationUseCase implements FutureUseCase<void, AuthForgotPasswordVerificationUseCaseParams> {

  const AuthForgotPasswordVerificationUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(AuthForgotPasswordVerificationUseCaseParams params) async {
    return await repository.forgotPasswordVerification(params.email, params.verificationCode);
  }
}

class AuthForgotPasswordVerificationUseCaseParams extends Equatable {

  const AuthForgotPasswordVerificationUseCaseParams({ 
    required this.email,
    required this.verificationCode
  });

  final String email;
  final String verificationCode;
  
  @override
  List<Object?> get props => [ email, verificationCode ];
}