import 'package:scial_app_server/src/business/friend_request_handler.dart';
import 'package:scial_app_server/src/generated/friend_request/response/friend_request_answer_response.dart';
import 'package:serverpod/serverpod.dart';

class FriendRequestEndpoint extends Endpoint {

  Future<FriendRequestAnswerResponse> answer(Session session, int friendRequestId, bool answer) async {
    return await FriendRequestHandler.answer(session, friendRequestId, answer);
  }
}