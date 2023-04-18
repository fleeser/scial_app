import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/auth/domain/use_cases/auth_sign_up_use_case.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {

  @override
  FutureOr<void> build() { }

  Future<bool> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _signUp(email, password));

    return !state.hasError;
  }

  Future<void> _signUp(String email, String password) async {
    return await ref.read(authSignUpUseCaseProvider).call(AuthSignUpUseCaseParams(email: email, password: password));
  }
}