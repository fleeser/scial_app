import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/use_cases/notifications_read_use_case.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/use_cases/notifications_set_all_read_use_case.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/use_cases/notifications_set_read_use_case.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_answer_friend_request_use_case.dart';

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

  Future<void> setRead(int notificationId) async {
    try {
      await ref.read(notificationsSetReadUseCaseProvider).call(NotificationsSetReadUseCaseParams(notificationId: notificationId));
      List<PublicNotification> notifications = List.from(state.value!);
      PublicNotification notification = notifications[notifications.indexWhere((element) => element.id == notificationId)];
      notification.read = true;
      notifications[notifications.indexWhere((element) => element.id == notificationId)] = notification;
      state = AsyncValue.data(notifications);
    } catch (_) {}
  }

  Future<void> setAllRead() async {
    try {
      ref.read(notificationsSetAllReadUseCaseProvider).call(const NotificationsSetAllReadUseCaseParams());
      List<PublicNotification> notifications = List.from(state.value!);
      notifications.where((element) => !element.read).forEach((element) => element.read = true);
      state = AsyncValue.data(notifications);
    } catch (_) {}
  }

  Future<bool> acceptRequest(int friendRequestId) async {
    try {
      await ref.read(userAnswerFriendRequestUseCaseProvider).call(UserAnswerFriendRequestUseCaseParams(friendRequestId: friendRequestId, answer: true));
    } catch (e) {
      return false;
    }

    List<PublicNotification> notifications = List.from(state.value!);
    PublicNotification notification = notifications[notifications.indexWhere((element) => element.data is PublicNotificationDataFriendRequestCreated && (element.data as PublicNotificationDataFriendRequestCreated).id  == friendRequestId)];
    (notification.data as PublicNotificationDataFriendRequestCreated).status = FriendRequestStatus.accepted;
    state = AsyncValue.data(notifications);

    return true;
  }

  Future<bool> denyRequest(int friendRequestId) async {
    try {
      await ref.read(userAnswerFriendRequestUseCaseProvider).call(UserAnswerFriendRequestUseCaseParams(friendRequestId: friendRequestId, answer: false));
    } catch (e) {
      return false;
    }

    List<PublicNotification> notifications = List.from(state.value!);
    PublicNotification notification = notifications[notifications.indexWhere((element) => element.data is PublicNotificationDataFriendRequestCreated && (element.data as PublicNotificationDataFriendRequestCreated).id == friendRequestId)];
    (notification.data as PublicNotificationDataFriendRequestCreated).status = FriendRequestStatus.denied;
    state = AsyncValue.data(notifications);

    return true;
  }
}