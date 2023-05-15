import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:scial_app_flutter/src/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'notifications_set_all_read_use_case.g.dart';

@riverpod
NotificationsSetAllReadUseCase notificationsSetAllReadUseCase(NotificationsSetAllReadUseCaseRef ref) => NotificationsSetAllReadUseCase(ref.read(notificationsRepositoryProvider));

class NotificationsSetAllReadUseCase implements FutureUseCase<void, NotificationsSetAllReadUseCaseParams> {

  const NotificationsSetAllReadUseCase(this.repository);

  final NotificationsRepository repository;

  @override
  Future<void> call(NotificationsSetAllReadUseCaseParams params) async {
    return await repository.setAllRead();
  }
}

class NotificationsSetAllReadUseCaseParams extends Equatable {

  const NotificationsSetAllReadUseCaseParams();
  
  @override
  List<Object?> get props => [ ];
}