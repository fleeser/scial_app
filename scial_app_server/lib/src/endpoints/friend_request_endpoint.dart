import 'package:scial_app_server/src/handlers/friend_request_handler.dart';
import 'package:scial_app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class FriendRequestEndpoint extends Endpoint {

  Future<FriendRequestCreateResponse> create(Session session, int userId, String? text) async {
    return await FriendRequestHandler.create(session, userId, text);
  }

  Future<FriendRequestAnswerResponse> answer(Session session, int friendRequestId, bool answer) async {
    return await FriendRequestHandler.answer(session, friendRequestId, answer);
  }

  Future<FriendRequestTakeBackResponse> takeBack(Session session, int friendRequestId) async {
    return await FriendRequestHandler.takeBack(session, friendRequestId);
  }
}