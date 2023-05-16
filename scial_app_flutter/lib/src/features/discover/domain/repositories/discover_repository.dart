import 'package:scial_app_client/scial_app_client.dart';

abstract class DiscoverRepository {
  Future<List<PublicEvent>> read(double lat, double long, List<EventType> eventTypes);
}