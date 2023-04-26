import 'package:scial_app_client/scial_app_client.dart';

abstract class UserDataSource {
  Future<PublicUser> read(int userId);
  Future<List<PublicUserRating>?> ratings(int userId);
}