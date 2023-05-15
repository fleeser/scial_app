import 'package:scial_app_client/scial_app_client.dart';

extension FriendshipBadgeExtension on FriendshipBadge {

  String get path {
    switch (this) {
      case FriendshipBadge.abc: return 'assets/badges/friendship/abc.svg';
    }
  }
}
