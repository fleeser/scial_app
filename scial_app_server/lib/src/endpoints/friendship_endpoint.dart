import 'package:scial_app_server/src/business/friendship_handler.dart';
import 'package:scial_app_server/src/generated/friendship/response/friendship_remove_response.dart';
import 'package:serverpod/serverpod.dart';

class FriendshipEndpoint extends Endpoint {

  Future<FriendshipRemoveResponse> remove(Session session, int friendshipId) async {
    return await FriendshipHandler.remove(session, friendshipId);
  }
}