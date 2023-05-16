import 'package:mapbox_search/mapbox_search.dart';
import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:scial_app_server/src/util/calculate_distance.dart';
import 'package:serverpod/serverpod.dart';

class DiscoverHandler {

  static Future<DiscoverReadResponse> read(Session session, double lat, double long, List<EventType> eventTypes) async {
    if (eventTypes.isEmpty) {
      return DiscoverReadResponse(
        success: true, 
        events: []
      );
    }

    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return DiscoverReadResponse(
        success: false,
        code: DiscoverReadResponseCode.notAuthenticated
      );
    }

    List<PublicEvent> events = [];

    // TODO: Secure
    List<Event> eventRows = await Event.find(session, where: (t) => Expression("events.type = ANY(ARRAY[$eventTypes])"));

    for (Event eventRow in eventRows) {

      List<PublicEventHost?> hosts = [];

      for (int hostId in eventRow.hosts) {
        User? hostRow = await User.findById(session, hostId);

        if (hostRow == null) {
          hosts.add(null);
        }

        PublicEventHost host = PublicEventHost(
          id: hostRow!.id!, 
          name: hostRow.name,
          imageUrl: hostRow.imageUrl,
          verified: hostRow.verified
        );

        hosts.add(host);
      }

      int guestCount = await EventGuest.count(session, where: (t) => t.event.equals(eventRow.id));

      List<String?> guestImages = [];

      List<EventGuest> guestRows = await EventGuest.find(session, where: (t) => t.event.equals(eventRow.id), limit: 5);

      for (EventGuest guestRow in guestRows) {
        int guestId = guestRow.user;

        User? guestUserRow = await User.findById(session, guestId);

        if (guestUserRow == null) {
          guestImages.add(null);
        }

        String? guestImageUrl = guestUserRow!.imageUrl;

        guestImages.add(guestImageUrl);
      }

      double distance = calculateDistance(lat, long, eventRow.lat, eventRow.long);

      ReverseGeoCoding reverseGeoCoding = ReverseGeoCoding(apiKey: Serverpod.instance!.getPassword('mapboxApiKey')!);
      List<MapBoxPlace>? places = await reverseGeoCoding.getAddress(Location(lat: eventRow.lat, lng: eventRow.long));
      PublicEventLocation location = PublicEventLocation(
        lat: eventRow.lat, 
        long: eventRow.long,
        name: places != null && places.isNotEmpty 
          ? places.first.placeName 
          : null
      );

      PublicEvent event = PublicEvent(
        id: eventRow.id!,
        created: eventRow.created,
        title: eventRow.title,
        imageUrl: eventRow.imageUrl,
        type: eventRow.type,
        visibility: eventRow.visibility,
        verified: eventRow.verified,
        start: eventRow.start,
        end: eventRow.end,
        hosts: hosts,
        guestCount: guestCount,
        guestImages: guestImages,
        distance: distance,
        location: location
      );

      events.add(event);
    }

    return DiscoverReadResponse(
      success: true, 
      events: events
    );
  }
}