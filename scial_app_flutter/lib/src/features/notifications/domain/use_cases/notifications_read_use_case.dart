import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'notifications_read_use_case.g.dart';

@riverpod
NotificationsReadUseCase notificationsReadUseCase(NotificationsReadUseCaseRef ref) => NotificationsReadUseCase(ref.read(notificationsRepositoryProvider));

class NotificationsReadUseCase implements FutureUseCase<void, NotificationsReadUseCaseParams> {

  const NotificationsReadUseCase(this.repository);

  final NotificationsRepository repository;

  @override
  Future<List<PublicNotification>> call(NotificationsReadUseCaseParams params) async {
    return await repository.read();
  }
}

class NotificationsReadUseCaseParams extends Equatable {

  const NotificationsReadUseCaseParams();
  
  @override
  List<Object?> get props => [ ];
}