import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class EventHandler {

  static Future<EventCreateResponse> create(Session session, String title, String? description, EventType type, EventVisibility visibility, DateTime start, DateTime end, double lat, double long, List<int> hosts, List<int> guests) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return EventCreateResponse(
        success: false,
        code: EventCreateResponseCode.notAuthenticated
      );
    }

    Event eventRow = Event(
      title: title,
      description: description,
      type: type,
      visibility: visibility,
      start: start,
      end: end,
      lat: lat,
      long: long,
      created: DateTime.now(),
      verified: false
    );

    await Event.insert(session, eventRow);

    EventHost eventHostRow = EventHost(
      user: authUserId, 
      event: eventRow.id!
    );

    await EventHost.insert(session, eventHostRow);

    for (int host in hosts) {
      EventHostInvitation eventHostInvitationRow = EventHostInvitation(
        user: host,
        sender: authUserId,
        event: eventRow.id!,
        created: DateTime.now(),
        status: EventHostInvitationStatus.pending
      );

      await EventHostInvitation.insert(session, eventHostInvitationRow);

      Notification eventHostInvitationNotificationRow = Notification(
        created: DateTime.now(),
        type: NotificationType.eventHostInvitationCreated,
        read: false,
        receiver: host,
        ref: eventHostInvitationRow.id!
      );

      await Notification.insert(session, eventHostInvitationNotificationRow);
    }

    for (int guest in guests) {
      EventGuestInvitation eventGuestInvitationRow = EventGuestInvitation(
        user: guest, 
        sender: authUserId, 
        event: eventRow.id!, 
        created: DateTime.now(), 
        status: EventGuestInvitationStatus.pending
      );

      await EventGuestInvitation.insert(session, eventGuestInvitationRow);

      Notification eventGuestInvitationNotificationRow = Notification(
        created: DateTime.now(),
        type: NotificationType.eventGuestInvitationCreated,
        read: false,
        receiver: guest,
        ref: eventGuestInvitationRow.id!
      );

      await Notification.insert(session, eventGuestInvitationNotificationRow);
    }

    return EventCreateResponse(
      success: true,
      eventId: eventRow.id
    );
  }

  static Future<EventGuestsResponse> guests(Session session, int eventId) async {
    int? authUserId = await session.auth.authenticatedUserId;
    if (authUserId == null) {
      return EventGuestsResponse(
        success: false,
        code: EventGuestsResponseCode.notAuthenticated
      );
    }

    Event? eventRow = await Event.findById(session, eventId);

    if (eventRow == null) {
      return EventGuestsResponse(
        success: false,
        code: EventGuestsResponseCode.eventNotFound
      );
    }

    if (eventRow.visibility != EventVisibility.public && (await EventHost.findSingleRow(session, where: (t) => t.event.equals(eventId) & t.user.equals(authUserId))) == null && (await EventHostInvitation.findSingleRow(session, where: (t) => t.event.equals(eventId) & t.user.equals(authUserId))) == null && (await EventGuest.findSingleRow(session, where: (t) => t.event.equals(eventId) & t.user.equals(authUserId))) == null && (await EventGuestInvitation.findSingleRow(session, where: (t) => t.event.equals(eventId) & t.user.equals(authUserId))) == null) {
      return EventGuestsResponse(
        success: false,
        code: eventRow.visibility == EventVisibility.private
          ? EventGuestsResponseCode.isPrivate
          : EventGuestsResponseCode.isProtected
      );
    }

    List<PublicEventFullGuest> guests = [];

    List<EventGuest> guestRows = await EventGuest.find(session, where: (t) => t.event.equals(eventId));

    for (EventGuest guestRow in guestRows) {
      User? guestUserRow = await User.findById(session, guestRow.user);

      PublicEventFullGuestUser? guestUser = guestUserRow != null
        ? PublicEventFullGuestUser(
          id: guestUserRow.id!,
          name: guestUserRow.name,
          imageUrl: guestUserRow.imageUrl,
          verified: guestUserRow.verified
        )
        : null;

      PublicEventFullGuest guest = PublicEventFullGuest(
        user: guestUser,
        joined: guestRow.created
      );

      guests.add(guest);
    }

    return EventGuestsResponse(
      success: true,
      guests: guests
    );
  }
}