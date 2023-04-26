import 'package:scial_app_server/src/business/user_handler.dart';
import 'package:scial_app_server/src/generated/user/response/user_ratings_response.dart';
import 'package:scial_app_server/src/generated/user/response/user_read_response.dart';
import 'package:serverpod/serverpod.dart';

class UserEndpoint extends Endpoint {

  Future<UserReadResponse> read(Session session, int userId) async {
    return await UserHandler.read(session, userId);
  }

  Future<UserRatingsResponse> ratings(Session session, int userId, { int? limit, int? offset }) async {
    return await UserHandler.ratings(session, userId, limit: limit, offset: offset);
  }
}