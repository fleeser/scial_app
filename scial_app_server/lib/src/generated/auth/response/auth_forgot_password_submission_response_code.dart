/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum AuthForgotPasswordSubmissionResponseCode with _i1.SerializableEntity {
  invalidEmail,
  invalidVerificationCode,
  weakPassword,
  requestNotFound,
  wrongVerificationCode,
  accountNotFound,
  userNotFound,
  samePassword;

  static AuthForgotPasswordSubmissionResponseCode? fromJson(int index) {
    switch (index) {
      case 0:
        return invalidEmail;
      case 1:
        return invalidVerificationCode;
      case 2:
        return weakPassword;
      case 3:
        return requestNotFound;
      case 4:
        return wrongVerificationCode;
      case 5:
        return accountNotFound;
      case 6:
        return userNotFound;
      case 7:
        return samePassword;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}
