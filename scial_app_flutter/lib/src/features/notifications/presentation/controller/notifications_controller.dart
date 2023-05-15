import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/use_cases/notifications_read_use_case.dart';

part 'notifications_controller.g.dart';

@riverpod
class NotificationsController extends _$NotificationsController {

  @override
  FutureOr<List<PublicNotification>> build() async {
    return _read();
  }

  Future<List<PublicNotification>> _read() async {
    return await ref.read(notificationsReadUseCaseProvider).call(const NotificationsReadUseCaseParams());
  }
}