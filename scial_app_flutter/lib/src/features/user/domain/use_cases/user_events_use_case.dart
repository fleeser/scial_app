import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:scial_app_flutter/src/features/user/domain/repositories/user_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'user_events_use_case.g.dart';

@riverpod
UserEventsUseCase userEventsUseCase(UserEventsUseCaseRef ref) => UserEventsUseCase(ref.read(userRepositoryProvider));

class UserEventsUseCase implements FutureUseCase<void, UserEventsUseCaseParams> {

  const UserEventsUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<List<PublicUserEvent>> call(UserEventsUseCaseParams params) async {
    return await repository.events(params.userId, params.lat, params.long);
  }
}

class UserEventsUseCaseParams extends Equatable {

  const UserEventsUseCaseParams({ 
    required this.userId,
    this.lat,
    this.long
  });

  final int userId;
  final double? lat;
  final double? long;
  
  @override
  List<Object?> get props => [ userId ];
}