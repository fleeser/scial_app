import 'package:mapbox_search/mapbox_search.dart';
import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DiscoverHandler {

  static Future<DiscoverReadResponse> read(Session session, double lat, double long, double distance, List<EventType> eventTypes, List<EventVisibility> eventVisibilities) async {
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
    String query = '''SELECT 
                        *, 
                        ROUND(earth_distance(ll_to_earth($lat, $long), ll_to_earth(lat, long))::NUMERIC, 2) AS distance
                      FROM
                        events
                      WHERE
                        earth_box(ll_to_earth ($lat, $long), $distance) @> ll_to_earth (lat, long)
                        AND earth_distance(ll_to_earth ($lat, $long), ll_to_earth (lat, long)) <= $distance
                        AND events.type = ANY(ARRAY[$eventTypes]) 
                        AND events.visibility = ANY(ARRAY[$eventVisibilities])
                        ORDER BY 
                          distance;''';

    List<List<dynamic>> eventRows = await session.db.query(query);

    for (List<dynamic> eventRow in eventRows) {

      int eventId = eventRow[0];
      EventType eventType = EventType.values[eventRow[1]];
      EventVisibility eventVisibility = EventVisibility.values[eventRow[2]];
      DateTime eventCreated = eventRow[3];
      String eventTitle = eventRow[4];
      bool eventVerified = eventRow[5];
      List<int> eventHosts = List<int>.from(eventRow[6]);
      double eventLat = eventRow[7];
      double eventLong = eventRow[8];
      DateTime eventStart = eventRow[10];
      DateTime eventEnd = eventRow[11];
      String? eventImageUrl = eventRow[12];
      double eventDistance = double.parse(eventRow[13]);

      if (eventDistance <= 100.0) eventDistance = 100.0;
      
      List<PublicEventHost?> hosts = [];

      for (int hostId in eventHosts) {
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

      int guestCount = await EventGuest.count(session, where: (t) => t.event.equals(eventId));

      List<String?> guestImages = [];

      List<EventGuest> guestRows = await EventGuest.find(session, where: (t) => t.event.equals(eventId), limit: 5);

      for (EventGuest guestRow in guestRows) {
        int guestId = guestRow.user;

        User? guestUserRow = await User.findById(session, guestId);

        if (guestUserRow == null) {
          guestImages.add(null);
        }

        String? guestImageUrl = guestUserRow!.imageUrl;

        guestImages.add(guestImageUrl);
      }

      ReverseGeoCoding reverseGeoCoding = ReverseGeoCoding(apiKey: Serverpod.instance!.getPassword('mapboxApiKey')!);
      List<MapBoxPlace>? places = await reverseGeoCoding.getAddress(Location(lat: eventLat, lng: eventLong));
      PublicEventLocation location = PublicEventLocation(
        lat: eventLat, 
        long: eventLong,
        name: places != null && places.isNotEmpty 
          ? places.first.placeName 
          : null
      );

      PublicEvent event = PublicEvent(
        id: eventId,
        created: eventCreated,
        title: eventTitle,
        imageUrl: eventImageUrl,
        type: eventType,
        visibility: eventVisibility,
        verified: eventVerified,
        start: eventStart,
        end: eventEnd,
        hosts: hosts,
        guestCount: guestCount,
        guestImages: guestImages,
        distance: eventDistance,
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