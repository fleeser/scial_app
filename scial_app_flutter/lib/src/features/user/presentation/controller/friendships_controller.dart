import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_friendships_use_case.dart';

part 'friendships_controller.g.dart';

@riverpod
class FriendshipsController extends _$FriendshipsController {

  @override
  FutureOr<List<PublicUserFriendship>> build(int userId) async {
    return await _read(userId);
  }

  Future<List<PublicUserFriendship>> _read(int userId) async {
    return await ref.read(userFriendshipsUseCaseProvider).call(UserFriendshipsUseCaseParams(userId: userId));
  }
}