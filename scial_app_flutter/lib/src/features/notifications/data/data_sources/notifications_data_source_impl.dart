import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/main.dart';
import 'package:scial_app_flutter/src/exceptions/server_exception.dart';
import 'package:scial_app_flutter/src/features/notifications/data/data_sources/notifications_data_source.dart';

part 'notifications_data_source_impl.g.dart';

@riverpod
NotificationsDataSource notificationsDataSource(NotificationsDataSourceRef ref) => NotificationsDataSourceImpl();

class NotificationsDataSourceImpl implements NotificationsDataSource {

  @override
  Future<List<PublicNotification>> read() async {
    NotificationReadResponse response = await client.notification.read();

    if (response.success) return response.notifications!;
    
    switch (response.code) {
      case NotificationReadResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> setRead(int notificationId) async {
    NotificationSetReadResponse response = await client.notification.setRead(notificationId);

    if (response.success) return;
    
    switch (response.code) {
      case NotificationSetReadResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case NotificationSetReadResponseCode.notificationNotFound: throw const ServerException.notificationsNotificationNotFound();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> setAllRead() async {
    NotificationSetAllReadResponse response = await client.notification.setAllRead();

    if (response.success) return;
    
    switch (response.code) {
      case NotificationSetAllReadResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      default: throw const ServerException.unknownError();
    }
  }
}