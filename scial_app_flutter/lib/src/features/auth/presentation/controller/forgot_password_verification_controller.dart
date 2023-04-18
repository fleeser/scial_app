import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/exceptions/app_exception.dart';
import 'package:scial_app_flutter/src/features/auth/domain/use_cases/auth_forgot_password_verification_use_case.dart';

part 'forgot_password_verification_controller.g.dart';

// TODO: Resend code

@riverpod
class ForgotPasswordVerificationController extends _$ForgotPasswordVerificationController {

  @override
  FutureOr<void> build() { }

  Future<bool> forgotPasswordVerification(String? email, String verificationCode) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _forgotPasswordVerification(email, verificationCode));
    return !state.hasError;
  }

  Future<void> _forgotPasswordVerification(String? email, String verificationCode) async {
    if (email == null) throw const AppException.authForgotPasswordVerificationEmailMissing();
    return await ref.read(authForgotPasswordVerificationUseCaseProvider).call(AuthForgotPasswordVerificationUseCaseParams(email: email, verificationCode: verificationCode));
  }
}