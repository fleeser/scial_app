import 'package:scial_app_client/scial_app_client.dart';

abstract class EventRepository {
  Future<List<PublicEventFullGuest>> guests(int eventId);
}