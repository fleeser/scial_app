import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:scial_app_server/src/handlers/discover_handler.dart';
import 'package:serverpod/serverpod.dart';

class DiscoverEndpoint extends Endpoint {

  Future<DiscoverReadResponse> read(Session session, double lat, double long, List<EventType> eventTypes) async {
    return await DiscoverHandler.read(session, lat, long, eventTypes);
  }
}