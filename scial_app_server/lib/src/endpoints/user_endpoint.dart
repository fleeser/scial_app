import 'package:scial_app_server/src/business/user_handler.dart';
import 'package:scial_app_server/src/generated/user/response/user_events_response.dart';
import 'package:scial_app_server/src/generated/user/response/user_friendships_response.dart';
import 'package:scial_app_server/src/generated/user/response/user_update_response.dart';
import 'package:scial_app_server/src/generated/user/response/user_ratings_response.dart';
import 'package:scial_app_server/src/generated/user/response/user_read_response.dart';
import 'package:serverpod/serverpod.dart';

class UserEndpoint extends Endpoint {

  Future<UserReadResponse> read(Session session, int userId) async {
    return await UserHandler.read(session, userId);
  }

  Future<UserUpdateResponse> update(Session session, { String? name, bool? isPrivate, required bool updateName, required bool updateIsPrivate }) async {
    return await UserHandler.update(session, name, isPrivate, updateName, updateIsPrivate);
  }

  Future<UserEventsResponse> events(Session session, int userId, double? lat, double? long, { int? limit, int? offset }) async {
    return await UserHandler.events(session, userId, lat, long, limit, offset);
  }

  Future<UserFriendshipsResponse> friendships(Session session, int userId, { int? limit, int? offset }) async {
    return await UserHandler.friendships(session, userId, limit, offset);
  }

  Future<UserRatingsResponse> ratings(Session session, int userId, { int? limit, int? offset }) async {
    return await UserHandler.ratings(session, userId, limit, offset);
  }
}