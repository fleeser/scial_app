import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_ratings_use_case.dart';

part 'ratings_controller.g.dart';

@riverpod
class RatingsController extends _$RatingsController {

  @override
  FutureOr<List<PublicUserRating>> build(int userId) async {
    return await _read(userId);
  }

  Future<List<PublicUserRating>> _read(int userId) async {
    return await ref.read(userRatingsUseCaseProvider).call(UserRatingsUseCaseParams(userId: userId));
  }
}