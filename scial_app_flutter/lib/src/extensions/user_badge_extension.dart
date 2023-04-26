import 'package:scial_app_client/scial_app_client.dart';

extension UserBadgeExtension on UserBadge {

  String get path {
    switch (this) {
      case UserBadge.beta: return 'assets/badges/beta.svg';
      case UserBadge.one: return 'assets/badges/one.svg';
    }
  }
}
