import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'server_exception.freezed.dart';

@freezed
class ServerException with _$ServerException {

  const factory ServerException.authSignUpInvalidEmail() = AuthSignUpInvalidEmail;
  const factory ServerException.authSignUpWeakPassword() = AuthSignUpWeakPassword;
  const factory ServerException.authSignUpAccountAlreadyExists() = AuthSignUpAccountAlreadyExists;

  const factory ServerException.authSignUpVerificationInvalidEmail() = AuthSignUpVerificationInvalidEmail;
  const factory ServerException.authSignUpVerificationInvalidVerificationCode() = AuthSignUpVerificationInvalidVerificationCode;
  const factory ServerException.authSignUpVerificationRequestNotFound() = AuthSignUpVerificationRequestNotFound;
  const factory ServerException.authSignUpVerificationWrongVerificationCode() = AuthSignUpVerificationWrongVerificationCode;

  const factory ServerException.authForgotPasswordInvalidEmail() = AuthForgotPasswordInvalidEmail;
  const factory ServerException.authForgotPasswordAccountNotFound() = AuthForgotPasswordAccountNotFound;

  const factory ServerException.authForgotPasswordVerificationInvalidEmail() = AuthForgotPasswordVerificationInvalidEmail;
  const factory ServerException.authForgotPasswordVerificationInvalidVerificationCode() = AuthForgotPasswordVerificationInvalidVerificationCode;
  const factory ServerException.authForgotPasswordVerificationRequestNotFound() = AuthForgotPasswordVerificationRequestNotFound;
  const factory ServerException.authForgotPasswordVerificationWrongVerificationCode() = AuthForgotPasswordVerificationWrongVerificationCode;

  const factory ServerException.authForgotPasswordSubmissionInvalidEmail() = AuthForgotPasswordSubmissionInvalidEmail;
  const factory ServerException.authForgotPasswordSubmissionInvalidVerificationCode() = AuthForgotPasswordSubmissionInvalidVerificationCode;
  const factory ServerException.authForgotPasswordSubmissionWeakPassword() = AuthForgotPasswordSubmissionWeakPassword;
  const factory ServerException.authForgotPasswordSubmissionRequestNotFound() = AuthForgotPasswordSubmissionRequestNotFound;
  const factory ServerException.authForgotPasswordSubmissionWrongVerificationCode() = AuthForgotPasswordSubmissionWrongVerificationCode;
  const factory ServerException.authForgotPasswordSubmissionAccountNotFound() = AuthForgotPasswordSubmissionAccountNotFound;
  const factory ServerException.authForgotPasswordSubmissionSamePassword() = AuthForgotPasswordSubmissionSamePassword;

  const factory ServerException.authSignInInvalidEmail() = AuthSignInInvalidEmail;
  const factory ServerException.authSignInWeakPassword() = AuthSignInWeakPassword;
  const factory ServerException.authSignInAccountNotFound() = AuthSignInAccountNotFound;
  const factory ServerException.authSignInWrongPassword() = AuthSignInWrongPassword;

  const factory ServerException.authChangePasswordWeakOldPassword() = AuthChangePasswordWeakOldPassword;
  const factory ServerException.authChangePasswordSamePassword() = AuthChangePasswordSamePassword;
  const factory ServerException.authChangePasswordWeakNewPassword() = AuthChangePasswordWeakNewPassword;
  const factory ServerException.authChangePasswordAccountNotFound() = AuthChangePasswordAccountNotFound;
  const factory ServerException.authChangePasswordOldPasswordWrong() = AuthChangePasswordOldPasswordWrong;

  const factory ServerException.authDeleteAccountWeakPassword() = AuthDeleteAccountWeakPassword;
  const factory ServerException.authDeleteAccountAccountNotFound() = AuthDeleteAccountAccountNotFound;
  const factory ServerException.authDeleteAccountWrongPassword() = AuthDeleteAccountWrongPassword;

  const factory ServerException.userReadUserNotFound() = UserReadUserNotFound;

  const factory ServerException.userEventsUserNotFound() = UserEventsUserNotFound;
  const factory ServerException.userEventsIsPrivate() = UserEventsIsPrivate;

  const factory ServerException.userFriendshipsUserNotFound() = UserFriendshipsUserNotFound;
  const factory ServerException.userFriendshipsIsPrivate() = UserFriendshipsIsPrivate;

  const factory ServerException.userRatingsUserNotFound() = UserRatingsUserNotFound;
  const factory ServerException.userRatingsIsPrivate() = UserRatingsIsPrivate;

  const factory ServerException.userRemoveFriendshipFriendshipNotFound() = UserRemoveFriendshipFriendshipNotFound;

  const factory ServerException.userAnswerFriendRequestFriendRequestNotFound() = UserAnswerFriendRequestFriendRequestNotFound;
  const factory ServerException.userAnswerFriendRequestFriendRequestAlreadyAnswered() = UserAnswerFriendRequestFriendRequestAlreadyAnswered;

  const factory ServerException.userTakeBackFriendRequestFriendRequestNotFound() = UserTakeBackFriendRequestFriendRequestNotFound;
  const factory ServerException.userTakeBackFriendRequestFriendRequestAlreadyAnswered() = UserTakeBackFriendRequestFriendRequestAlreadyAnswered;

  const factory ServerException.userCreateFriendRequestFriendRequestAlreadyExists() = UserCreateFriendRequestFriendRequestAlreadyExists;

  const factory ServerException.userUpdateUserNotFound() = UserUpdateUserNotFound;

  const factory ServerException.notAuthenticated() = NotAuthenticated;

  const factory ServerException.unknownError() = UnknownError;
}

extension ServerExceptionExtension on ServerException {

  String translation(BuildContext context) {
    return when(
      authSignUpInvalidEmail: () => AppLocalizations.of(context)!.auth_sign_up_invalid_email,
      authSignUpWeakPassword: () => AppLocalizations.of(context)!.auth_sign_up_weak_password,
      authSignUpAccountAlreadyExists: () => AppLocalizations.of(context)!.auth_sign_up_account_already_exists,

      authSignUpVerificationInvalidEmail: () => AppLocalizations.of(context)!.auth_sign_up_verification_invalid_email,
      authSignUpVerificationInvalidVerificationCode: () => AppLocalizations.of(context)!.auth_sign_up_verification_invalid_verification_code,
      authSignUpVerificationRequestNotFound: () => AppLocalizations.of(context)!.auth_sign_up_verification_request_not_found,
      authSignUpVerificationWrongVerificationCode: () => AppLocalizations.of(context)!.auth_sign_up_verification_wrong_verification_code,

      authForgotPasswordInvalidEmail: () => AppLocalizations.of(context)!.auth_forgot_password_invalid_email,
      authForgotPasswordAccountNotFound: () => AppLocalizations.of(context)!.auth_forgot_password_account_not_found,

      authForgotPasswordVerificationInvalidEmail: () => AppLocalizations.of(context)!.auth_forgot_password_verification_invalid_email,
      authForgotPasswordVerificationInvalidVerificationCode: () => AppLocalizations.of(context)!.auth_forgot_password_verification_invalid_verification_code,
      authForgotPasswordVerificationRequestNotFound: () => AppLocalizations.of(context)!.auth_forgot_password_verification_request_not_found,
      authForgotPasswordVerificationWrongVerificationCode: () => AppLocalizations.of(context)!.auth_forgot_password_verification_wrong_verification_code,

      authForgotPasswordSubmissionInvalidEmail: () => AppLocalizations.of(context)!.auth_forgot_password_submission_invalid_email,
      authForgotPasswordSubmissionInvalidVerificationCode: () => AppLocalizations.of(context)!.auth_forgot_password_submission_invalid_verification_code,
      authForgotPasswordSubmissionWeakPassword: () => AppLocalizations.of(context)!.auth_forgot_password_submission_weak_password,
      authForgotPasswordSubmissionRequestNotFound: () => AppLocalizations.of(context)!.auth_forgot_password_submission_request_not_found,
      authForgotPasswordSubmissionWrongVerificationCode: () => AppLocalizations.of(context)!.auth_forgot_password_submission_wrong_verification_code,
      authForgotPasswordSubmissionAccountNotFound: () => AppLocalizations.of(context)!.auth_forgot_password_submission_account_not_found,
      authForgotPasswordSubmissionSamePassword: () => AppLocalizations.of(context)!.auth_forgot_password_submission_same_password,

      authSignInInvalidEmail: () => AppLocalizations.of(context)!.auth_sign_in_invalid_email,
      authSignInWeakPassword: () => AppLocalizations.of(context)!.auth_sign_in_weak_password,
      authSignInAccountNotFound: () => AppLocalizations.of(context)!.auth_sign_in_account_not_found,
      authSignInWrongPassword: () => AppLocalizations.of(context)!.auth_sign_in_wrong_password,

      authChangePasswordWeakOldPassword: () => AppLocalizations.of(context)!.auth_change_password_weak_old_password,
      authChangePasswordSamePassword: () => AppLocalizations.of(context)!.auth_change_password_same_password,
      authChangePasswordWeakNewPassword: () => AppLocalizations.of(context)!.auth_change_password_weak_new_password,
      authChangePasswordAccountNotFound: () => AppLocalizations.of(context)!.auth_change_password_account_not_found,
      authChangePasswordOldPasswordWrong: () => AppLocalizations.of(context)!.auth_change_password_old_password_wrong,

      authDeleteAccountWeakPassword: () => AppLocalizations.of(context)!.auth_delete_account_weak_password,
      authDeleteAccountAccountNotFound: () => AppLocalizations.of(context)!.auth_delete_account_account_not_found,
      authDeleteAccountWrongPassword: () => AppLocalizations.of(context)!.auth_delete_account_wrong_password,

      userReadUserNotFound: () => AppLocalizations.of(context)!.user_read_user_not_found,

      userEventsUserNotFound: () => AppLocalizations.of(context)!.user_events_user_not_found,
      userEventsIsPrivate: () => AppLocalizations.of(context)!.user_events_is_private,

      userFriendshipsUserNotFound: () => AppLocalizations.of(context)!.user_friendships_user_not_found,
      userFriendshipsIsPrivate: () => AppLocalizations.of(context)!.user_friendships_is_private,
      
      userRatingsUserNotFound: () => AppLocalizations.of(context)!.user_ratings_user_not_found,
      userRatingsIsPrivate: () => AppLocalizations.of(context)!.user_ratings_is_private,

      userRemoveFriendshipFriendshipNotFound: () => AppLocalizations.of(context)!.user_remove_friendship_friendship_not_found,

      userAnswerFriendRequestFriendRequestNotFound: () => AppLocalizations.of(context)!.user_answer_friend_request_friend_request_not_found,
      userAnswerFriendRequestFriendRequestAlreadyAnswered: () => AppLocalizations.of(context)!.user_answer_friend_request_friend_request_already_answered,

      userTakeBackFriendRequestFriendRequestNotFound: () => AppLocalizations.of(context)!.user_take_back_friend_request_friend_request_not_found,
      userTakeBackFriendRequestFriendRequestAlreadyAnswered: () => AppLocalizations.of(context)!.user_take_back_friend_request_friend_request_already_answered,

      userCreateFriendRequestFriendRequestAlreadyExists: () => AppLocalizations.of(context)!.user_create_friend_request_friend_request_already_exists,

      userUpdateUserNotFound: () => AppLocalizations.of(context)!.user_update_user_not_found,

      notAuthenticated: () => AppLocalizations.of(context)!.not_authenticated,

      unknownError: () => AppLocalizations.of(context)!.unknown_error
    );
  }
}