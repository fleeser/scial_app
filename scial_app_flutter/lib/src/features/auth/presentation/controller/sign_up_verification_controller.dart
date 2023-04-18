import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/exceptions/app_exception.dart';
import 'package:scial_app_flutter/src/features/auth/domain/use_cases/auth_sign_up_verification_use_case.dart';

part 'sign_up_verification_controller.g.dart';

// TODO: Resend code

@riverpod
class SignUpVerificationController extends _$SignUpVerificationController {

  @override
  FutureOr<void> build() { }

  Future<void> signUpVerification(String? email, String verificationCode) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _signUpVerification(email, verificationCode));
  }

  Future<void> _signUpVerification(String? email, String verificationCode) async {
    if (email == null) throw const AppException.authSignUpVerificationEmailMissing();
    return await ref.read(authSignUpVerificationUseCaseProvider).call(AuthSignUpVerificationUseCaseParams(email: email, verificationCode: verificationCode));
  }
}