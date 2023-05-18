import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/main.dart';
import 'package:scial_app_flutter/src/exceptions/server_exception.dart';
import 'package:scial_app_flutter/src/features/event/data/data_sources/event_data_source.dart';

part 'event_data_source_impl.g.dart';

@riverpod
EventDataSource eventDataSource(EventDataSourceRef ref) => EventDataSourceImpl();

class EventDataSourceImpl implements EventDataSource {

  @override
  Future<List<PublicEventFullGuest>> guests(int eventId) async {
    EventGuestsResponse response = await client.event.guests(eventId);

    if (response.success) return response.guests!;
    
    switch (response.code) {
      case EventGuestsResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case EventGuestsResponseCode.eventNotFound: throw const ServerException.eventGuestsEventNotFound();
      case EventGuestsResponseCode.isPrivate: throw const ServerException.eventGuestsIsPrivate();
      case EventGuestsResponseCode.isProtected: throw const ServerException.eventGuestsIsProtected();
      default: throw const ServerException.unknownError();
    }
  }
}