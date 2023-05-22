import 'package:scial_app_client/scial_app_client.dart';

abstract class SearchUserDataSource {
  Future<List<PublicUserSearchUser>> search(String searchText);
}