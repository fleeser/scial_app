import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TestEndpoint extends Endpoint {

  Future<void> test(Session session) async {
    //await User.insert(session, User(name: "Stefan Röpges", created: DateTime.now(), verified: true, private: true, badges: [], uniqueCode: "00000002"));
    //await FriendRequest.insert(session, FriendRequest(sender: 2, receiver: 1, status: FriendRequestStatus.pending, created: DateTime.now(), text: "Ey wir kennen uns doch oder nicht?"));
    //await User.insert(session, User(name: 'Stefan Röpges', created: DateTime.now(), verified: true, private: true, badges: [ UserBadge.beta, UserBadge.one ]));
    //await Friendship.insert(session, Friendship(users: [1, 2], created: DateTime.now(), badges: [ FriendshipBadge.abc ]));
    //await Rating.insert(session, Rating(created: DateTime.now(), type: RatingType.guest, sender: 2, receiver: 1, stars: 5, text: 'Echt ein geiler Typ gewesen vallah sogar wtf schreibe ich hier eigenltich für einen Müll nur um zu sehen was passiert bzw ob der Text abgeschnitten wird. Direkt auch mal n Rechtschreibfehler am Anfang lol xd'));

    /*await Event.insert(session, Event(type: EventType.party, visibility: EventVisibility.private, created: DateTime.now(), title: 'ikdfej df', verified: false, hosts: [1, 2], lat: 32.2, long: 23.4, start: DateTime.now(), end: DateTime.now()));
    await Event.insert(session, Event(type: EventType.party, visibility: EventVisibility.private, created: DateTime.now(), title: 'deed df', verified: false, hosts: [1], lat: 32.2, long: 23.4, start: DateTime.now(), end: DateTime.now()));
    await Event.insert(session, Event(type: EventType.party, visibility: EventVisibility.private, created: DateTime.now(), title: 'eeeeeeeee df', verified: false, hosts: [2], lat: 32.2, long: 23.4, start: DateTime.now(), end: DateTime.now()));

    await EventGuest.insert(session, EventGuest(user: 1, event: 1, created: DateTime.now()));
    await EventGuest.insert(session, EventGuest(user: 2, event: 1, created: DateTime.now()));
    await EventGuest.insert(session, EventGuest(user: 1, event: 2, created: DateTime.now()));
    await EventGuest.insert(session, EventGuest(user: 1, event: 3, created: DateTime.now()));
    await EventGuest.insert(session, EventGuest(user: 2, event: 3, created: DateTime.now()));*/
  }
}