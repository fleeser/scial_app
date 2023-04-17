import 'package:scial_app_server/src/business/auth_handler.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_change_password_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_delete_account_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_submission_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_verification_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_in_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_up_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_up_verification_response.dart';
import 'package:serverpod/serverpod.dart';

class AuthEndpoint extends Endpoint {

  Future<AuthSignUpResponse> signUp(Session session, String email, String password) async {
    return await AuthHandler.signUp(session, email, password);
  }

  Future<AuthSignUpVerificationResponse> signUpVerification(Session session, String email, String verificationCode) async {
    return await AuthHandler.signUpVerification(session, email, verificationCode);
  }

  Future<AuthForgotPasswordResponse> forgotPassword(Session session, String email) async {
    return await AuthHandler.forgotPassword(session, email);
  }

  Future<AuthForgotPasswordVerificationResponse> forgotPasswordVerification(Session session, String email, String verificationCode) async {
    return await AuthHandler.forgotPasswordVerification(session, email, verificationCode);
  }

  Future<AuthForgotPasswordSubmissionResponse> forgotPasswordSubmission(Session session, String email, String verificationCode, String password) async {
    return await AuthHandler.forgotPasswordSubmission(session, email, verificationCode, password);
  }

  Future<AuthSignInResponse> signIn(Session session, String email, String password) async {
    return await AuthHandler.signIn(session, email, password);
  }

  Future<AuthChangePasswordResponse> changePassword(Session session, String oldPassword, String newPassword) async {
    return await AuthHandler.changePassword(session, oldPassword, newPassword);
  }

  Future<AuthDeleteAccountResponse> deleteAccount(Session session, String password) async {
    return await AuthHandler.deleteAccount(session, password);
  }
}