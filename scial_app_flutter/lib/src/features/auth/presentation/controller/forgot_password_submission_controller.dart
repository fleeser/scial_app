import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/exceptions/app_exception.dart';
import 'package:scial_app_flutter/src/features/auth/domain/use_cases/auth_forgot_password_submission_use_case.dart';

part 'forgot_password_submission_controller.g.dart';

// TODO: Resend code

@riverpod
class ForgotPasswordSubmissionController extends _$ForgotPasswordSubmissionController {

  @override
  FutureOr<void> build() { }

  Future<bool> forgotPasswordSubmission(String? email, String? verificationCode, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _forgotPasswordSubmission(email, verificationCode, password));
    return !state.hasError;
  }

  Future<void> _forgotPasswordSubmission(String? email, String? verificationCode, String password) async {
    if (email == null) throw const AppException.authForgotPasswordSubmissionEmailMissing();
    if (verificationCode == null) throw const AppException.authForgotPasswordSubmissionVerificationCodeMissing();
    return await ref.read(authForgotPasswordSubmissionUseCaseProvider).call(AuthForgotPasswordSubmissionUseCaseParams(email: email, verificationCode: verificationCode, password: password));
  }
}