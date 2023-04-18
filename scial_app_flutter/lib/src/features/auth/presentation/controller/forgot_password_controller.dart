import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/domain/use_cases/auth_forgot_password_use_case.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {

  @override
  FutureOr<void> build() { }

  Future<bool> forgotPassword(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _forgotPassword(email));
    return !state.hasError;
  }

  Future<void> _forgotPassword(String email) async {
    return await ref.read(authForgotPasswordUseCaseProvider).call(AuthForgotPasswordUseCaseParams(email: email));
  }
}