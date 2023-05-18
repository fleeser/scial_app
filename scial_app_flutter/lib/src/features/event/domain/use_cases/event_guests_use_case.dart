import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/event/data/repositories/event_repository_impl.dart';
import 'package:scial_app_flutter/src/features/event/domain/repositories/event_repository.dart';
import 'package:scial_app_flutter/src/use_case.dart';

part 'event_guests_use_case.g.dart';

@riverpod
EventGuestsUseCase eventGuestsUseCase(EventGuestsUseCaseRef ref) => EventGuestsUseCase(ref.read(eventRepositoryProvider));

class EventGuestsUseCase implements FutureUseCase<void, EventGuestsUseCaseParams> {

  const EventGuestsUseCase(this.repository);

  final EventRepository repository;

  @override
  Future<List<PublicEventFullGuest>> call(EventGuestsUseCaseParams params) async {
    return await repository.guests(params.eventId);
  }
}

class EventGuestsUseCaseParams extends Equatable {

  const EventGuestsUseCaseParams({ 
    required this.eventId
  });

  final int eventId;
  
  @override
  List<Object?> get props => [ eventId ];
}