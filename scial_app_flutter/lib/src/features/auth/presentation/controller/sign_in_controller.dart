import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/domain/use_cases/auth_sign_in_use_case.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {

  @override
  FutureOr<void> build() { }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _signIn(email, password));
  }

  void forgotPassword(BuildContext context) {
    context.navigateToForgotPasswordPage();
  }

  void signUp(BuildContext context) {
    context.navigateToSignUpPage();
  }

  Future<void> _signIn(String email, String password) async {
    return await ref.read(authSignInUseCaseProvider).call(AuthSignInUseCaseParams(email: email, password: password));
  }
}