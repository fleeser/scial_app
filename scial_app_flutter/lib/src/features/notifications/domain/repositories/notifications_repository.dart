import 'package:scial_app_client/scial_app_client.dart';

abstract class NotificationsRepository {
  Future<List<PublicNotification>> read();
  Future<void> setRead(int notificationId);
  Future<void> setAllRead();
}