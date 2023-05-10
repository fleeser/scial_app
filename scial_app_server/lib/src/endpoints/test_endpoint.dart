import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TestEndpoint extends Endpoint {

  Future<void> test(Session session) async {
    //await User.insert(session, User(name: "Stefan Röpges", created: DateTime.now(), verified: true, private: true, badges: []));
    //await FriendRequest.insert(session, FriendRequest(sender: 2, receiver: 1, status: FriendRequestStatus.pending, created: DateTime.now(), text: "Ey wir kennen uns doch oder nicht?"));

    await Friendship.insert(session, Friendship(users: [1, 2], created: DateTime.now(), badges: [ FriendshipBadge.abc ]));
    await Rating.insert(session, Rating(created: DateTime.now(), type: RatingType.guest, sender: 2, receiver: 1, stars: 5, text: 'Echt ein geiler Typ gewesen vallah sogar wtf schreibe ich hier eigenltich für einen Müll nur um zu sehen was passiert bzw ob der Text abgeschnitten wird. Direkt auch mal n Rechtschreibfehler am Anfang lol xd'));
  }
}