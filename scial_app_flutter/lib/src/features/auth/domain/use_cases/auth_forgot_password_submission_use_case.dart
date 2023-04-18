import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scial_app_flutter/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'auth_forgot_password_submission_use_case.g.dart';

@riverpod
AuthForgotPasswordSubmissionUseCase authForgotPasswordSubmissionUseCase(AuthForgotPasswordSubmissionUseCaseRef ref) => AuthForgotPasswordSubmissionUseCase(ref.read(authRepositoryProvider));

class AuthForgotPasswordSubmissionUseCase implements FutureUseCase<void, AuthForgotPasswordSubmissionUseCaseParams> {

  const AuthForgotPasswordSubmissionUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(AuthForgotPasswordSubmissionUseCaseParams params) async {
    return await repository.forgotPasswordSubmission(params.email, params.verificationCode, params.password);
  }
}

class AuthForgotPasswordSubmissionUseCaseParams extends Equatable {

  const AuthForgotPasswordSubmissionUseCaseParams({ 
    required this.email,
    required this.verificationCode,
    required this.password
  });

  final String email;
  final String verificationCode;
  final String password;
  
  @override
  List<Object?> get props => [ email, verificationCode, password ];
}