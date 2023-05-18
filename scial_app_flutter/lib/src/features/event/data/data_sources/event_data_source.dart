import 'package:scial_app_client/scial_app_client.dart';

abstract class EventDataSource {
  Future<List<PublicEventFullGuest>> guests(int eventId);
}