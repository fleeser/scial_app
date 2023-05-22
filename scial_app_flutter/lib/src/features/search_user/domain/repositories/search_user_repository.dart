import 'package:scial_app_client/scial_app_client.dart';

abstract class SearchUserRepository {
  Future<List<PublicUserSearchUser>> search(String searchText); // TODO: Pad left and right and constrain to 6 digits when # at start
}