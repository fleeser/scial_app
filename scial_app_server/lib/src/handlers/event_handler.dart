import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class EventHandler {

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

    if (eventRow.visibility != EventVisibility.public && !eventRow.hosts.contains(authUserId) && (await EventGuest.findSingleRow(session, where: (t) => t.event.equals(eventId) & t.user.equals(authUserId))) == null && (await EventInvitation.findSingleRow(session, where: (t) => t.event.equals(eventId) & t.user.equals(authUserId))) == null) {
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