/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum NotificationReadResponseCode with _i1.SerializableEntity {
  notAuthenticated;

  static NotificationReadResponseCode? fromJson(int index) {
    switch (index) {
      case 0:
        return notAuthenticated;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}
