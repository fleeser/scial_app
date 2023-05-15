import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'notifications_set_read_use_case.g.dart';

@riverpod
NotificationsSetReadUseCase notificationsSetReadUseCase(NotificationsSetReadUseCaseRef ref) => NotificationsSetReadUseCase(ref.read(notificationsRepositoryProvider));

class NotificationsSetReadUseCase implements FutureUseCase<void, NotificationsSetReadUseCaseParams> {

  const NotificationsSetReadUseCase(this.repository);

  final NotificationsRepository repository;

  @override
  Future<void> call(NotificationsSetReadUseCaseParams params) async {
    return await repository.setRead(params.notificationId);
  }
}

class NotificationsSetReadUseCaseParams extends Equatable {

  const NotificationsSetReadUseCaseParams({
    required this.notificationId
  });

  final int notificationId;
  
  @override
  List<Object?> get props => [ notificationId ];
}