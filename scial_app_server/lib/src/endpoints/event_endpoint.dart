import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:scial_app_server/src/handlers/event_handler.dart';
import 'package:serverpod/serverpod.dart';

class EventEndpoint extends Endpoint {

  Future<EventCreateResponse> create(Session session, String title, String? description, EventType type, EventVisibility visibility, DateTime start, DateTime end, double lat, double long, List<int> hosts, List<int> guests) async {
    return await EventHandler.create(session, title, description, type, visibility, start, end, lat, long, hosts, guests);
  }

  Future<EventGuestsResponse> guests(Session session, int eventId) async {
    return await EventHandler.guests(session, eventId);
  }
}