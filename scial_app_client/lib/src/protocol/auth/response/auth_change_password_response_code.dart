/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum AuthChangePasswordResponseCode with _i1.SerializableEntity {
  notAuthenticated,
  weakOldPassword,
  weakNewPassword,
  samePassword,
  accountNotFound,
  oldPasswordWrong;

  static AuthChangePasswordResponseCode? fromJson(int index) {
    switch (index) {
      case 0:
        return notAuthenticated;
      case 1:
        return weakOldPassword;
      case 2:
        return weakNewPassword;
      case 3:
        return samePassword;
      case 4:
        return accountNotFound;
      case 5:
        return oldPasswordWrong;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}
