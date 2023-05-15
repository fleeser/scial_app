import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {

  const factory AppException.authSignUpInvalidEmail() = AuthSignUpInvalidEmail;
  const factory AppException.authSignUpWeakPassword() = AuthSignUpWeakPassword;

  const factory AppException.authSignUpVerificationEmailMissing() = AuthSignUpVerificationEmailMissing;
  const factory AppException.authSignUpVerificationInvalidEmail() = AuthSignUpVerificationInvalidEmail;
  const factory AppException.authSignUpVerificationInvalidVerificationCode() = AuthSignUpVerificationInvalidVerificationCode;

  const factory AppException.authForgotPasswordInvalidEmail() = AuthForgotPasswordInvalidEmail;

  const factory AppException.authForgotPasswordVerificationEmailMissing() = AuthForgotPasswordVerificationEmailMissing;
  const factory AppException.authForgotPasswordVerificationInvalidEmail() = AuthForgotPasswordVerificationInvalidEmail;
  const factory AppException.authForgotPasswordVerificationInvalidVerificationCode() = AuthForgotPasswordVerificationInvalidVerificationCode;

  const factory AppException.authForgotPasswordSubmissionEmailMissing() = AuthForgotPasswordSubmissionEmailMissing;
  const factory AppException.authForgotPasswordSubmissionVerificationCodeMissing() = AuthForgotPasswordSubmissionVerificationCodeMissing;
  const factory AppException.authForgotPasswordSubmissionInvalidEmail() = AuthForgotPasswordSubmissionInvalidEmail;
  const factory AppException.authForgotPasswordSubmissionInvalidVerificationCode() = AuthForgotPasswordSubmissionInvalidVerificationCode;
  const factory AppException.authForgotPasswordSubmissionWeakPassword() = AuthForgotPasswordSubmissionWeakPassword;

  const factory AppException.authSignInInvalidEmail() = AuthSignInInvalidEmail;
  const factory AppException.authSignInWeakPassword() = AuthSignInWeakPassword;

  const factory AppException.authChangePasswordWeakOldPassword() = AuthChangePasswordWeakOldPassword;
  const factory AppException.authChangePasswordSamePassword() = AuthChangePasswordSamePassword;
  const factory AppException.authChangePasswordWeakNewPassword() = AuthChangePasswordWeakNewPassword;

  const factory AppException.authDeleteAccountWeakPassword() = AuthDeleteAccountWeakPassword;

  const factory AppException.locationServiceDisabled() = LocationServiceDisabled;
  const factory AppException.locationDeniedForever() = LocationDeniedForever;
  const factory AppException.locationDenied() = LocationDenied;
  const factory AppException.locationPointNotFound() = LocationPointNotFound;
  const factory AppException.locationNameNotFound() = LocationNameNotFound;

  const factory AppException.noInternetConnection() = NoInternetConnection;

  const factory AppException.unknownError() = UnknownError;
}

extension AppExceptionExtension on AppException {

  String translation(BuildContext context) {
    return when(
      authSignUpInvalidEmail: () => AppLocalizations.of(context)!.auth_sign_up_invalid_email,
      authSignUpWeakPassword: () => AppLocalizations.of(context)!.auth_sign_up_weak_password,

      authSignUpVerificationEmailMissing: () => AppLocalizations.of(context)!.auth_sign_up_verification_email_missing,
      authSignUpVerificationInvalidEmail: () => AppLocalizations.of(context)!.auth_sign_up_verification_invalid_email,
      authSignUpVerificationInvalidVerificationCode: () => AppLocalizations.of(context)!.auth_sign_up_verification_invalid_verification_code,

      authForgotPasswordInvalidEmail: () => AppLocalizations.of(context)!.auth_forgot_password_invalid_email,

      authForgotPasswordVerificationEmailMissing: () => AppLocalizations.of(context)!.auth_forgot_password_verification_email_missing,
      authForgotPasswordVerificationInvalidEmail: () => AppLocalizations.of(context)!.auth_forgot_password_verification_invalid_email,
      authForgotPasswordVerificationInvalidVerificationCode: () => AppLocalizations.of(context)!.auth_forgot_password_verification_invalid_verification_code,

      authForgotPasswordSubmissionEmailMissing: () => AppLocalizations.of(context)!.auth_forgot_password_submission_email_missing,
      authForgotPasswordSubmissionVerificationCodeMissing: () => AppLocalizations.of(context)!.auth_forgot_password_submission_verification_code_missing,
      authForgotPasswordSubmissionInvalidEmail: () => AppLocalizations.of(context)!.auth_forgot_password_submission_invalid_email,
      authForgotPasswordSubmissionInvalidVerificationCode: () => AppLocalizations.of(context)!.auth_forgot_password_submission_invalid_verification_code,
      authForgotPasswordSubmissionWeakPassword: () => AppLocalizations.of(context)!.auth_forgot_password_submission_weak_password,

      authSignInInvalidEmail: () => AppLocalizations.of(context)!.auth_sign_in_invalid_email,
      authSignInWeakPassword: () => AppLocalizations.of(context)!.auth_sign_in_weak_password,

      authChangePasswordWeakOldPassword: () => AppLocalizations.of(context)!.auth_change_password_weak_old_password,
      authChangePasswordSamePassword: () => AppLocalizations.of(context)!.auth_change_password_same_password,
      authChangePasswordWeakNewPassword: () => AppLocalizations.of(context)!.auth_change_password_weak_new_password,

      authDeleteAccountWeakPassword: () => AppLocalizations.of(context)!.auth_delete_account_weak_password,

      locationServiceDisabled: () => AppLocalizations.of(context)!.location_service_disabled,
      locationDeniedForever: () => AppLocalizations.of(context)!.location_denied_forever,
      locationDenied: () => AppLocalizations.of(context)!.location_denied,
      locationPointNotFound: () => AppLocalizations.of(context)!.location_point_not_found,
      locationNameNotFound: () => AppLocalizations.of(context)!.location_name_not_found,

      noInternetConnection: () => AppLocalizations.of(context)!.no_internet_connection,

      unknownError: () => AppLocalizations.of(context)!.unknown_error
    );
  }
}