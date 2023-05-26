/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum UserUpdateResponseCode with _i1.SerializableEntity {
  notAuthenticated,
  invalidName,
  userNotFound;

  static UserUpdateResponseCode? fromJson(int index) {
    switch (index) {
      case 0:
        return notAuthenticated;
      case 1:
        return invalidName;
      case 2:
        return userNotFound;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}
