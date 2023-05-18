import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/event/data/data_sources/event_data_source.dart';
import 'package:scial_app_flutter/src/features/event/data/data_sources/event_data_source_impl.dart';
import 'package:scial_app_flutter/src/features/event/domain/repositories/event_repository.dart';

part 'event_repository_impl.g.dart';

@Riverpod(keepAlive: true)
EventRepository eventRepository(EventRepositoryRef ref) {
  final dataSource = ref.read(eventDataSourceProvider);
  final eventRepository = EventRepositoryImpl(dataSource);
  return eventRepository;
}

class EventRepositoryImpl implements EventRepository {

  const EventRepositoryImpl(this.dataSource);

  final EventDataSource dataSource;

  @override
  Future<List<PublicEventFullGuest>> guests(int eventId) async {
    return await dataSource.guests(eventId);
  }
}