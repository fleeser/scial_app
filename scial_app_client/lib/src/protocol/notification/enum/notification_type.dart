/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum NotificationType with _i1.SerializableEntity {
  friendRequestCreated,
  friendRequestAccepted,
  friendRequestDenied;

  static NotificationType? fromJson(int index) {
    switch (index) {
      case 0:
        return friendRequestCreated;
      case 1:
        return friendRequestAccepted;
      case 2:
        return friendRequestDenied;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}
