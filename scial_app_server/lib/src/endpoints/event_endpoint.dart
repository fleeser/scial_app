import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:scial_app_server/src/handlers/event_handler.dart';
import 'package:serverpod/serverpod.dart';

class EventEndpoint extends Endpoint {

  Future<EventGuestsResponse> guests(Session session, int eventId) async {
    return await EventHandler.guests(session, eventId);
  }
}