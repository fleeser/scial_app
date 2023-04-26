import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_read_use_case.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {

  @override
  FutureOr<PublicUser> build(int userId) async {
    return await _read(userId);
  }

  Future<PublicUser> _read(int userId) async {
    return await ref.read(userReadUseCaseProvider).call(UserReadUseCaseParams(userId: userId));
  }
}