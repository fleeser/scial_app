import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/main.dart';
import 'package:scial_app_flutter/src/exceptions/server_exception.dart';
import 'package:scial_app_flutter/src/features/auth/data/data_sources/auth_data_source.dart';

part 'auth_data_source_impl.g.dart';

@riverpod
AuthDataSource authDataSource(AuthDataSourceRef ref) => AuthDataSourceImpl();

class AuthDataSourceImpl implements AuthDataSource {

  @override
  Future<void> signUp(String email, String password) async {
    AuthSignUpResponse response = await client.auth.signUp(email, password);

    if (response.success) return;
    
    switch (response.code) {
      case AuthSignUpResponseCode.invalidEmail: throw const ServerException.authSignUpInvalidEmail();
      case AuthSignUpResponseCode.weakPassword: throw const ServerException.authSignUpWeakPassword();
      case AuthSignUpResponseCode.accountAlreadyExists: throw const ServerException.authSignUpAccountAlreadyExists();
      default: throw const ServerException.unknownError();
    }
  }
  
  @override
  Future<({ int keyId, String key, int userId, String uniqueCode })> signUpVerification(String email, String verificationCode) async {
    AuthSignUpVerificationResponse response = await client.auth.signUpVerification(email, verificationCode);

    if (response.success) {
      return (keyId: response.keyId!, key: response.key!, userId: response.userId!, uniqueCode: response.uniqueCode!);
    }

    switch (response.code) {
      case AuthSignUpVerificationResponseCode.invalidEmail: throw const ServerException.authSignUpVerificationInvalidEmail();
      case AuthSignUpVerificationResponseCode.invalidVerificationCode: throw const ServerException.authSignUpVerificationInvalidVerificationCode();
      case AuthSignUpVerificationResponseCode.requestNotFound: throw const ServerException.authSignUpVerificationRequestNotFound();
      case AuthSignUpVerificationResponseCode.wrongVerificationCode: throw const ServerException.authSignUpVerificationWrongVerificationCode();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    AuthForgotPasswordResponse response = await client.auth.forgotPassword(email);

    if (response.success) return;

    switch (response.code) {
      case AuthForgotPasswordResponseCode.invalidEmail: throw const ServerException.authForgotPasswordInvalidEmail();
      case AuthForgotPasswordResponseCode.accountNotFound: throw const ServerException.authForgotPasswordAccountNotFound();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> forgotPasswordVerification(String email, String verificationCode) async {
    AuthForgotPasswordVerificationResponse response = await client.auth.forgotPasswordVerification(email, verificationCode);

    if (response.success) return;

    switch (response.code) {
      case AuthForgotPasswordVerificationResponseCode.invalidEmail: throw const ServerException.authForgotPasswordVerificationInvalidEmail();
      case AuthForgotPasswordVerificationResponseCode.invalidVerificationCode: throw const ServerException.authForgotPasswordVerificationInvalidVerificationCode();
      case AuthForgotPasswordVerificationResponseCode.requestNotFound: throw const ServerException.authForgotPasswordVerificationRequestNotFound();
      case AuthForgotPasswordVerificationResponseCode.wrongVerificationCode: throw const ServerException.authForgotPasswordVerificationWrongVerificationCode();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<({ int keyId, String key, int userId, String uniqueCode })?> forgotPasswordSubmission(String email, String verificationCode, String password) async {
    AuthForgotPasswordSubmissionResponse response = await client.auth.forgotPasswordSubmission(email, verificationCode, password);

    if (response.success) {
      if (response.keyId != null) {
        return (keyId: response.keyId!, key: response.key!, userId: response.userId!, uniqueCode: response.uniqueCode!);
      }

      return null;
    }

    switch (response.code) {
      case AuthForgotPasswordSubmissionResponseCode.invalidEmail: throw const ServerException.authForgotPasswordSubmissionInvalidEmail();
      case AuthForgotPasswordSubmissionResponseCode.invalidVerificationCode: throw const ServerException.authForgotPasswordSubmissionInvalidVerificationCode();
      case AuthForgotPasswordSubmissionResponseCode.weakPassword: throw const ServerException.authForgotPasswordSubmissionWeakPassword();
      case AuthForgotPasswordSubmissionResponseCode.requestNotFound: throw const ServerException.authForgotPasswordSubmissionRequestNotFound();
      case AuthForgotPasswordSubmissionResponseCode.wrongVerificationCode: throw const ServerException.authForgotPasswordSubmissionWrongVerificationCode();
      case AuthForgotPasswordSubmissionResponseCode.accountNotFound: throw const ServerException.authForgotPasswordSubmissionAccountNotFound();
      case AuthForgotPasswordSubmissionResponseCode.userNotFound: throw const ServerException.authForgotPasswordSubmissionUserNotFound();
      case AuthForgotPasswordSubmissionResponseCode.samePassword: throw const ServerException.authForgotPasswordSubmissionSamePassword();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<({ int keyId, String key, int userId, String uniqueCode })> signIn(String email, String password) async {
    AuthSignInResponse response = await client.auth.signIn(email, password);

    if (response.success) {
      return (keyId: response.keyId!, key: response.key!, userId: response.userId!, uniqueCode: response.uniqueCode!);
    }

    switch (response.code) {
      case AuthSignInResponseCode.invalidEmail: throw const ServerException.authSignInInvalidEmail();
      case AuthSignInResponseCode.weakPassword: throw const ServerException.authSignInWeakPassword();
      case AuthSignInResponseCode.accountNotFound: throw const ServerException.authSignInAccountNotFound();
      case AuthSignInResponseCode.userNotFound: throw const ServerException.authSignInUserNotFound();
      case AuthSignInResponseCode.wrongPassword: throw const ServerException.authSignInWrongPassword();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    AuthChangePasswordResponse response = await client.auth.changePassword(oldPassword, newPassword);

    if (response.success) return;

    switch (response.code) {
      case AuthChangePasswordResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case AuthChangePasswordResponseCode.weakOldPassword: throw const ServerException.authChangePasswordWeakOldPassword();
      case AuthChangePasswordResponseCode.samePassword: throw const ServerException.authChangePasswordSamePassword();
      case AuthChangePasswordResponseCode.weakNewPassword: throw const ServerException.authChangePasswordWeakNewPassword();
      case AuthChangePasswordResponseCode.accountNotFound: throw const ServerException.authChangePasswordAccountNotFound();
      case AuthChangePasswordResponseCode.oldPasswordWrong: throw const ServerException.authChangePasswordOldPasswordWrong();
      default: throw const ServerException.unknownError();
    }
  }

  @override
  Future<void> deleteAccount(String password) async {
    AuthDeleteAccountResponse response = await client.auth.deleteAccount(password);

    if (response.success) return;

    switch (response.code) {
      case AuthDeleteAccountResponseCode.notAuthenticated: throw const ServerException.notAuthenticated();
      case AuthDeleteAccountResponseCode.weakPassword: throw const ServerException.authDeleteAccountWeakPassword();
      case AuthDeleteAccountResponseCode.accountNotFound: throw const ServerException.authDeleteAccountAccountNotFound();
      case AuthDeleteAccountResponseCode.wrongPassword: throw const ServerException.authDeleteAccountWrongPassword();
      default: throw const ServerException.unknownError();
    }
  }
}