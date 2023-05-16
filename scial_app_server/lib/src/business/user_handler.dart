import 'package:mapbox_search/mapbox_search.dart';
import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:scial_app_server/src/util/calculate_distance.dart';
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

    List<PublicUserEvent> events = [];

    List<Event> eventRows = await Event.find(session, where: (t) => Expression("(events.hosts::jsonb @> '[$userId]' OR EXISTS (SELECT 1 FROM event_guests WHERE event_guests.event = events.id AND event_guests.user = $userId)) AND (NOT (events.visibility = 2) OR events.hosts::jsonb @> '[$authUserId]' OR EXISTS (SELECT 1 FROM event_guests WHERE event_guests.event = events.id AND event_guests.user = $authUserId) OR EXISTS (SELECT 1 FROM event_invitations WHERE event_invitations.event = events.id AND event_invitations.user = $authUserId AND status = 2))"));

    for (Event eventRow in eventRows) {
      List<PublicUserEventHost?> hosts = [];

      for (int hostId in eventRow.hosts) {
        User? hostRow = await User.findById(session, hostId);

        if (hostRow == null) {
          hosts.add(null);
          continue;
        }

        PublicUserEventHost host = PublicUserEventHost(
          id: hostRow.id!, 
          verified: hostRow.verified,
          name: hostRow.name,
          imageUrl: hostRow.imageUrl
        );

        hosts.add(host);
      }

      int guestCount = await EventGuest.count(session, where: (t) => t.event.equals(eventRow.id));

      List<String?> guestImages = [];

      List<EventGuest> eventGuestRows = await EventGuest.find(session, where: (t) => t.event.equals(eventRow.id), limit: 5);

      for (EventGuest eventGuestRow in eventGuestRows) {
        User? eventGuestUserRow = await User.findById(session, eventGuestRow.user);

        String? eventGuestImageUrl = eventGuestUserRow?.imageUrl;
        guestImages.add(eventGuestImageUrl);
      }

      PublicUserEvent event = PublicUserEvent(
        id: eventRow.id!, 
        type: eventRow.type, 
        visibility: eventRow.visibility, 
        created: eventRow.created, 
        title: eventRow.title, 
        verified: eventRow.verified, 
        start: eventRow.start, 
        end: eventRow.end, 
        hosts: hosts,
        guestCount: guestCount, 
        guestImages: guestImages
      );

      if (eventRow.visibility == EventVisibility.public || eventRow.hosts.contains(authUserId) || (await EventGuest.findSingleRow(session, where: (t) => t.event.equals(eventRow.id) & t.user.equals(authUserId))) != null || (await EventInvitation.findSingleRow(session, where: (t) => t.event.equals(eventRow.id) & t.user.equals(authUserId))) != null) {
        PublicUserEventLocation location = PublicUserEventLocation(
          lat: eventRow.lat, 
          long: eventRow.long
        );

        Serverpod.instance!.getPassword('mapboxApiKey')!;

        ReverseGeoCoding reverseGeoCoding = ReverseGeoCoding(apiKey: Serverpod.instance!.getPassword('mapboxApiKey')!);
        List<MapBoxPlace>? places = await reverseGeoCoding.getAddress(Location(lat: eventRow.lat, lng: eventRow.long));

        if (places != null && places.isNotEmpty) {
          location.name = places.first.placeName;
        }

        event.location = location;
      }

      if (lat != null && long != null && (eventRow.visibility != EventVisibility.private || eventRow.hosts.contains(authUserId) || (await EventGuest.findSingleRow(session, where: (t) => t.event.equals(eventRow.id) & t.user.equals(authUserId))) != null || (await EventInvitation.findSingleRow(session, where: (t) => t.event.equals(eventRow.id) & t.user.equals(authUserId))) != null)) {
        event.distance = calculateDistance(lat, long, eventRow.lat, eventRow.long);
      }

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
}