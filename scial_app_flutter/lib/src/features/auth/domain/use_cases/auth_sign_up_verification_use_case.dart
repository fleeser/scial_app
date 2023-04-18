import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scial_app_flutter/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'auth_sign_up_verification_use_case.g.dart';

@riverpod
AuthSignUpVerificationUseCase authSignUpVerificationUseCase(AuthSignUpVerificationUseCaseRef ref) => AuthSignUpVerificationUseCase(ref.read(authRepositoryProvider));

class AuthSignUpVerificationUseCase implements FutureUseCase<void, AuthSignUpVerificationUseCaseParams> {

  const AuthSignUpVerificationUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(AuthSignUpVerificationUseCaseParams params) async {
    return await repository.signUpVerification(params.email, params.verificationCode);
  }
}

class AuthSignUpVerificationUseCaseParams extends Equatable {

  const AuthSignUpVerificationUseCaseParams({
    required this.email,
    required this.verificationCode
  });

  final String email;
  final String verificationCode;
  
  @override
  List<Object?> get props => [ email, verificationCode ];
}