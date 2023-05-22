import 'package:mapbox_search/mapbox_search.dart';
import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:scial_app_shared/scial_app_shared.dart';
import 'package:serverpod/serverpod.dart';

class UserHandler {

  static Future<UserReadResponse> read(Session session, int userId) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserReadResponse(
        success: false,
        code: UserReadResponseCode.notAuthenticated
      );
    }
    
    User? userRow = await User.findById(session, userId);

    if (userRow == null) {
      return UserReadResponse(
        success: false,
        code: UserReadResponseCode.userNotFound
      );
    }

    PublicUser user = PublicUser(
      id: userRow.id!, 
      name: userRow.name, 
      imageUrl: userRow.imageUrl,
      verified: userRow.verified, 
      private: userRow.private, 
      badges: userRow.badges
    );

    if (userId != authUserId) {
      List<int> users = [ userId, authUserId ]..sort();
      Friendship? friendshipRow = await Friendship.findSingleRow(session, where: (t) => Expression("${t.users.columnName}::json::text = '$users'"));
      if (friendshipRow != null) {
        user.friendship = PublicUserFriendshipDetails(
          id: friendshipRow.id!, 
          created: friendshipRow.created,
          badges: friendshipRow.badges
        );
      } else {
        FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => ((t.sender.equals(userId) & t.receiver.equals(authUserId)) | (t.sender.equals(authUserId) & t.receiver.equals(userId))) & t.status.equals(FriendRequestStatus.pending));

        if (friendRequestRow != null) {
          user.friendRequest = PublicUserFriendRequest(
            id: friendRequestRow.id!, 
            created: friendRequestRow.created, 
            text: friendRequestRow.text,
            isSender: authUserId == friendRequestRow.sender
          );
        }
      }
    }

    return UserReadResponse(
      success: true,
      user: user
    );
  }

  static Future<UserUpdateResponse> update(Session session, String? name, bool? isPrivate, bool updateName, bool updateIsPrivate) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserUpdateResponse(
        success: false,
        code: UserUpdateResponseCode.notAuthenticated
      );
    }

    User? userRow = await User.findById(session, authUserId);

    if (userRow == null) {
      return UserUpdateResponse(
        success: false,
        code: UserUpdateResponseCode.userNotFound
      );
    }

    if (updateName) {
      userRow.name = name;
    }

    if (updateIsPrivate) {
      userRow.private = isPrivate!;
    }

    await User.update(session, userRow);

    // TODO transaction

    return UserUpdateResponse(success: true);
  }

  static Future<UserEventsResponse> events(Session session, int userId, double? lat, double? long, int? limit, int? offset) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserEventsResponse(
        success: false,
        code: UserEventsResponseCode.notAuthenticated
      );
    }

    User? userRow = await User.findById(session, userId);

    if (userRow == null) {
      return UserEventsResponse(
        success: false,
        code: UserEventsResponseCode.userNotFound
      );
    }

    if (userId != authUserId && userRow.private) {

      List<int> users = [ userId, authUserId ]..sort();
      Friendship? friendshipRow = await Friendship.findSingleRow(session, where: (t) => Expression("${t.users.columnName}::json::text = '$users'"));

      if (friendshipRow == null) {
        FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => (t.sender.equals(userId) & t.receiver.equals(authUserId)) & t.status.equals(FriendRequestStatus.pending));

        if (friendRequestRow == null) {
          return UserEventsResponse(
            success: false,
            code: UserEventsResponseCode.isPrivate
          );
        }
      }
    }

    List<PublicEvent> events = [];

    // TODO: Secure
    String query = '''SELECT 
                        *, 
                        ROUND(earth_distance(ll_to_earth($lat, $long), ll_to_earth(lat, long))::NUMERIC, 2) AS distance
                      FROM
                        events
                      WHERE
                        (events.hosts::jsonb @> '[$userId]' OR EXISTS (SELECT 1 FROM event_guests WHERE event_guests.event = events.id AND event_guests.user = $userId)) AND (NOT (events.visibility = 2) OR events.hosts::jsonb @> '[$authUserId]' OR EXISTS (SELECT 1 FROM event_guests WHERE event_guests.event = events.id AND event_guests.user = $authUserId) OR EXISTS (SELECT 1 FROM event_invitations WHERE event_invitations.event = events.id AND event_invitations.user = $authUserId AND status = 2))
                        ORDER BY 
                          start;'''; // TODO: Sort desc?

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

    return UserEventsResponse(
      success: true,
      events: events
    );
  }

  static Future<UserFriendshipsResponse> friendships(Session session, int userId, int? limit, int? offset) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserFriendshipsResponse(
        success: false,
        code: UserFriendshipsResponseCode.notAuthenticated
      );
    }

    User? userRow = await User.findById(session, userId);

    if (userRow == null) {
      return UserFriendshipsResponse(
        success: false,
        code: UserFriendshipsResponseCode.userNotFound
      );
    }

    if (userId != authUserId && userRow.private) {

      List<int> users = [ userId, authUserId ]..sort();
      Friendship? friendshipRow = await Friendship.findSingleRow(session, where: (t) => Expression("${t.users.columnName}::json::text = '$users'"));

      if (friendshipRow == null) {
        FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => (t.sender.equals(userId) & t.receiver.equals(authUserId)) & t.status.equals(FriendRequestStatus.pending));

        if (friendRequestRow == null) {
          return UserFriendshipsResponse(
            success: false,
            code: UserFriendshipsResponseCode.isPrivate
          );
        }
      }
    }

    List<PublicUserFriendship> friendships = [];

    List<Friendship> friendshipRows = await Friendship.find(session, where: (t) => Expression("${t.users.columnName}::json::text LIKE '[$userId,%' OR ${t.users.columnName}::json::text LIKE '%,$userId]'"), limit: limit, offset: offset);

    for (Friendship friendshipRow in friendshipRows) {
      User? friendshipUserRow = await User.findById(session, friendshipRow.users.firstWhere((element) => element != userId));

      PublicUserFriendshipUser? friendshipUser;
      if (friendshipUserRow != null) {
        friendshipUser = PublicUserFriendshipUser(
          id: friendshipUserRow.id!, 
          name: friendshipUserRow.name,
          imageUrl: friendshipUserRow.imageUrl,
          verified: friendshipUserRow.verified
        );
      }

      PublicUserFriendship friendship = PublicUserFriendship(
        id: friendshipRow.id!,
        created: friendshipRow.created, 
        user: friendshipUser,
        badges: friendshipRow.badges
      );

      friendships.add(friendship);
    }

    return UserFriendshipsResponse(
      success: true,
      friendships: friendships
    );
  }

  static Future<UserRatingsResponse> ratings(Session session, int userId, int? limit, int? offset) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserRatingsResponse(
        success: false,
        code: UserRatingsResponseCode.notAuthenticated
      );
    }

    User? userRow = await User.findById(session, userId);

    if (userRow == null) {
      return UserRatingsResponse(
        success: false,
        code: UserRatingsResponseCode.userNotFound
      );
    }

    if (userId != authUserId && userRow.private) {

      List<int> users = [ userId, authUserId ]..sort();
      Friendship? friendshipRow = await Friendship.findSingleRow(session, where: (t) => Expression("${t.users.columnName}::json::text = '$users'"));

      if (friendshipRow == null) {
        FriendRequest? friendRequestRow = await FriendRequest.findSingleRow(session, where: (t) => (t.sender.equals(userId) & t.receiver.equals(authUserId)) & t.status.equals(FriendRequestStatus.pending));

        if (friendRequestRow == null) {
          return UserRatingsResponse(
            success: false,
            code: UserRatingsResponseCode.isPrivate
          );
        }
      }
    }

    List<PublicUserRating> ratings = [];

    List<Rating> ratingRows = await Rating.find(session, where: (t) => t.receiver.equals(userId), limit: limit, offset: offset);

    for (Rating ratingRow in ratingRows) {
      User? ratingUserRow = await User.findById(session, ratingRow.sender);

      PublicUserRatingUser? ratingUser;
      if (ratingUserRow != null) {
        ratingUser = PublicUserRatingUser(
          id: ratingUserRow.id!, 
          name: ratingUserRow.name,
          imageUrl: ratingUserRow.imageUrl,
          verified: ratingUserRow.verified
        );
      }

      PublicUserRating rating = PublicUserRating(
        id: ratingRow.id!, 
        type: ratingRow.type, 
        created: ratingRow.created, 
        sender: ratingUser,
        stars: ratingRow.stars,
        text: ratingRow.text
      );

      ratings.add(rating);
    }

    return UserRatingsResponse(
      success: true,
      ratings: ratings
    );
  }

  static Future<UserSearchResponse> search(Session session, String searchText, int? limit, int? offset) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return UserSearchResponse(
        success: false,
        code: UserSearchResponseCode.notAuthenticated
      );
    }

    searchText = searchText.trim();

    if (searchText.startsWith('#')) {
      searchText = searchText.toUpperCase();
      bool uniqueCodeIsValid = Validator.validateUniqueCode(searchText.substring(1));
      if (!uniqueCodeIsValid) {
        return UserSearchResponse(
          success: false,
          code: UserSearchResponseCode.invalidUniqueCode
        );
      }
    }

    User? authUserRow = await User.findById(session, authUserId);

    if (authUserRow == null) {
      return UserSearchResponse(
        success: false,
        code: UserSearchResponseCode.userNotFound
      );
    }

    List<PublicUserSearchUser> users = [];

    if (searchText.startsWith('#')) {
      User? userRow = await User.findSingleRow(session, where: (t) => t.uniqueCode.equals(searchText.substring(1)) & t.uniqueCode.notEquals(authUserRow.uniqueCode));

      if (userRow != null) {
        PublicUserSearchUser user = PublicUserSearchUser(
          id: userRow.id!, 
          name: userRow.name,
          imageUrl: userRow.imageUrl,
          verified: userRow.verified
        );

        users.add(user);
      }
    } else {
      List<User> userRows = await User.find(session, where: (t) => t.name.like(searchText) & t.uniqueCode.notEquals(authUserRow.uniqueCode), limit: limit, offset: offset);

      for (User userRow in userRows) {
        PublicUserSearchUser user = PublicUserSearchUser(
          id: userRow.id!, 
          name: userRow.name,
          imageUrl: userRow.imageUrl,
          verified: userRow.verified
        );

        users.add(user);
      }
    }

    return UserSearchResponse(
      success: true,
      users: users
    );
  }
}