import 'package:scial_app_client/scial_app_client.dart';

abstract class DiscoverDataSource {
  Future<List<PublicEvent>> read(double lat, double long, List<EventType> eventTypes);
}