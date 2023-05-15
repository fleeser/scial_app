import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/notifications/data/data_sources/notifications_data_source.dart';
import 'package:scial_app_flutter/src/features/notifications/data/data_sources/notifications_data_source_impl.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/repositories/notifications_repository.dart';

part 'notifications_repository_impl.g.dart';

@Riverpod(keepAlive: true)
NotificationsRepository notificationsRepository(NotificationsRepositoryRef ref) {
  final dataSource = ref.read(notificationsDataSourceProvider);
  final notificationsRepository = NotificationsRepositoryImpl(dataSource);
  return notificationsRepository;
}

class NotificationsRepositoryImpl implements NotificationsRepository {

  const NotificationsRepositoryImpl(this.dataSource);

  final NotificationsDataSource dataSource;

  @override
  Future<List<PublicNotification>> read() async {
    return await dataSource.read();
  }

  @override
  Future<void> setRead(int notificationId) async {
    return await dataSource.setRead(notificationId);
  }

  @override
  Future<void> setAllRead() async {
    return await dataSource.setAllRead();
  }
}