import 'package:scial_app_server/src/generated/auth/response/auth_change_password_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_change_password_response_code.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_delete_account_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_delete_account_response_code.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_response_code.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_submission_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_submission_response_code.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_verification_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_forgot_password_verification_response_code.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_in_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_in_response_code.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_up_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_up_response_code.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_up_verification_response.dart';
import 'package:scial_app_server/src/generated/auth/response/auth_sign_up_verification_response_code.dart';
import 'package:scial_app_server/src/generated/auth/table/auth_email.dart';
import 'package:scial_app_server/src/generated/auth/table/auth_forgot_password_request.dart';
import 'package:scial_app_server/src/generated/auth/table/auth_sign_up_request.dart';
import 'package:scial_app_server/src/generated/user/table/user.dart';
import 'package:scial_app_server/src/util/emailer.dart';
import 'package:scial_app_server/src/util/password_hash_generator.dart';
import 'package:scial_app_server/src/util/verification_code_generator.dart';
import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:scial_app_shared/scial_app_shared.dart';

class AuthHandler {

  static Future<AuthSignUpResponse> signUp(Session session, String email, String password) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) {
      return AuthSignUpResponse(
        success: false,
        code: AuthSignUpResponseCode.invalidEmail
      ); 
    }

    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) {
      return AuthSignUpResponse(
        success: false,
        code: AuthSignUpResponseCode.weakPassword
      ); 
    }

    AuthEmail? auth = await AuthEmail.findSingleRow(session, where: (t) => t.email.equals(email));

    if (auth != null) {
      return AuthSignUpResponse(
        success: false,
        code: AuthSignUpResponseCode.accountAlreadyExists
      );
    }

    String verificationCode = VerificationCodeGenerator.generate();

    AuthSignUpRequest? authSignUpRequest = await AuthSignUpRequest.findSingleRow(session, where: (t) => t.email.equals(email));

    if (authSignUpRequest == null) {
      String passwordHash = PasswordHashGenerator.generate(password);

      authSignUpRequest = AuthSignUpRequest(
        email: email, 
        hash: passwordHash, 
        verificationCode: verificationCode
      );

      await AuthSignUpRequest.insert(session, authSignUpRequest);
    } else {
      authSignUpRequest.verificationCode = verificationCode;

      await AuthSignUpRequest.update(session, authSignUpRequest);
    }

    await Emailer.sendVerificationEmail(email, verificationCode);

    return AuthSignUpResponse(success: true);
  }

  static Future<AuthSignUpVerificationResponse> signUpVerification(Session session, String email, String verificationCode) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) {
      return AuthSignUpVerificationResponse(
        success: false,
        code: AuthSignUpVerificationResponseCode.invalidEmail
      ); 
    }

    verificationCode = verificationCode.trim();
    bool verificationCodeIsValid = Validator.validateVerificationCode(verificationCode);
    if (!verificationCodeIsValid) {
      return AuthSignUpVerificationResponse(
        success: false,
        code: AuthSignUpVerificationResponseCode.invalidVerificationCode
      ); 
    }

    AuthSignUpRequest? authSignUpRequest = await AuthSignUpRequest.findSingleRow(session, where: (t) => t.email.equals(email));

    if (authSignUpRequest == null) {
      return AuthSignUpVerificationResponse(
        success: false,
        code: AuthSignUpVerificationResponseCode.requestNotFound
      );
    }

    if (authSignUpRequest.verificationCode != verificationCode) {
      return AuthSignUpVerificationResponse(
        success: false,
        code: AuthSignUpVerificationResponseCode.wrongVerificationCode
      );
    }

    User user = User(
      created: DateTime.now(),
      verified: false,
      private: true,
      badges: []
    );

    await User.insert(session, user);

    AuthEmail auth = AuthEmail(
      userId: user.id!,
      email: email,
      hash: authSignUpRequest.hash
    );

    await AuthEmail.insert(session, auth);

    AuthKey key = await session.auth.signInUser(auth.userId, 'email');

    return AuthSignUpVerificationResponse(
      success: true,
      keyId: key.id,
      key: key.key,
      userId: key.userId
    );
  }

  static Future<AuthForgotPasswordResponse> forgotPassword(Session session, String email) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) {
      return AuthForgotPasswordResponse(
        success: false,
        code: AuthForgotPasswordResponseCode.invalidEmail
      );
    }

    AuthEmail? auth = await AuthEmail.findSingleRow(session, where: (t) => t.email.equals(email));

    if (auth == null) {
      return AuthForgotPasswordResponse(
        success: false,
        code: AuthForgotPasswordResponseCode.accountNotFound
      );
    }

    AuthForgotPasswordRequest? authForgotPasswordRequest = await AuthForgotPasswordRequest.findSingleRow(session, where: (t) => t.email.equals(email));

    String verificationCode = VerificationCodeGenerator.generate();

    if (authForgotPasswordRequest == null) {
      authForgotPasswordRequest = AuthForgotPasswordRequest(
        email: email,
        verificationCode: verificationCode
      );

      await AuthForgotPasswordRequest.insert(session, authForgotPasswordRequest);
    } else {
      authForgotPasswordRequest.verificationCode = verificationCode;
      await AuthForgotPasswordRequest.update(session, authForgotPasswordRequest);
    }

    await Emailer.sendVerificationEmail(email, verificationCode);

    return AuthForgotPasswordResponse(success: true);
  }

  static Future<AuthForgotPasswordVerificationResponse> forgotPasswordVerification(Session session, String email, String verificationCode) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) {
      return AuthForgotPasswordVerificationResponse(
        success: false,
        code: AuthForgotPasswordVerificationResponseCode.invalidEmail
      );
    }
    
    verificationCode = verificationCode.trim();
    bool verificationCodeIsValid = Validator.validateVerificationCode(verificationCode);
    if (!verificationCodeIsValid) {
      return AuthForgotPasswordVerificationResponse(
        success: false,
        code: AuthForgotPasswordVerificationResponseCode.invalidVerificationCode
      ); 
    }

    AuthForgotPasswordRequest? authForgotPasswordRequest = await AuthForgotPasswordRequest.findSingleRow(session, where: (t) => t.email.equals(email));

    if (authForgotPasswordRequest == null) {
      return AuthForgotPasswordVerificationResponse(
        success: false,
        code: AuthForgotPasswordVerificationResponseCode.requestNotFound
      );
    }

    if (authForgotPasswordRequest.verificationCode != verificationCode) {
      return AuthForgotPasswordVerificationResponse(
        success: false,
        code: AuthForgotPasswordVerificationResponseCode.wrongVerificationCode
      );
    }

    return AuthForgotPasswordVerificationResponse(success: true);
  }

  static Future<AuthForgotPasswordSubmissionResponse> forgotPasswordSubmission(Session session, String email, String verificationCode, String password) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) {
      return AuthForgotPasswordSubmissionResponse(
        success: false,
        code: AuthForgotPasswordSubmissionResponseCode.invalidEmail
      );
    }
    
    verificationCode = verificationCode.trim();
    bool verificationCodeIsValid = Validator.validateVerificationCode(verificationCode);
    if (!verificationCodeIsValid) {
      return AuthForgotPasswordSubmissionResponse(
        success: false,
        code: AuthForgotPasswordSubmissionResponseCode.invalidVerificationCode
      ); 
    }
    
    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) {
      return AuthForgotPasswordSubmissionResponse(
        success: false,
        code: AuthForgotPasswordSubmissionResponseCode.weakPassword
      ); 
    }

    AuthForgotPasswordRequest? authForgotPasswordRequest = await AuthForgotPasswordRequest.findSingleRow(session, where: (t) => t.email.equals(email));
    
    if (authForgotPasswordRequest == null) {
      return AuthForgotPasswordSubmissionResponse(
        success: false,
        code: AuthForgotPasswordSubmissionResponseCode.requestNotFound
      ); 
    }

    if (authForgotPasswordRequest.verificationCode != verificationCode) {
      return AuthForgotPasswordSubmissionResponse(
        success: false,
        code: AuthForgotPasswordSubmissionResponseCode.wrongVerificationCode
      ); 
    }

    AuthEmail? auth = await AuthEmail.findSingleRow(session, where: (t) => t.email.equals(email));

    if (auth == null) {
      return AuthForgotPasswordSubmissionResponse(
        success: false,
        code: AuthForgotPasswordSubmissionResponseCode.accountNotFound
      ); 
    }

    String hash = PasswordHashGenerator.generate(password);

    if (auth.hash == hash) {
      return AuthForgotPasswordSubmissionResponse(
        success: false,
        code: AuthForgotPasswordSubmissionResponseCode.samePassword
      );
    }

    auth.hash = hash;
    await AuthEmail.update(session, auth);

    AuthKey? key;
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    if (authenticatedUserId == null) {
      key = await session.auth.signInUser(auth.userId, 'email');
    }

    return AuthForgotPasswordSubmissionResponse(
      success: true,
      keyId: key?.id,
      key: key?.key,
      userId: key?.userId
    );
  }

  static Future<AuthSignInResponse> signIn(Session session, String email, String password) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) {
      return AuthSignInResponse(
        success: false,
        code: AuthSignInResponseCode.invalidEmail
      ); 
    }

    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) {
      return AuthSignInResponse(
        success: false,
        code: AuthSignInResponseCode.weakPassword
      ); 
    }

    AuthEmail? auth = await AuthEmail.findSingleRow(session, where: (t) => t.email.equals(email));

    if (auth == null) {
      return AuthSignInResponse(
        success: false,
        code: AuthSignInResponseCode.accountNotFound
      );
    }

    String passwordHash = PasswordHashGenerator.generate(password);

    if (auth.hash != passwordHash) {
      return AuthSignInResponse(
        success: false,
        code: AuthSignInResponseCode.wrongPassword
      );
    }

    AuthKey key = await session.auth.signInUser(auth.userId, 'email');

    return AuthSignInResponse(
      success: true,
      keyId: key.id,
      key: key.key,
      userId: key.userId
    );
  }

  static Future<AuthChangePasswordResponse> changePassword(Session session, String oldPassword, String newPassword) async {
    int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      return AuthChangePasswordResponse(
        success: false,
        code: AuthChangePasswordResponseCode.notAuthenticated
      );
    }
    
    oldPassword = oldPassword.trim();
    bool oldPasswordIsValid = Validator.validatePassword(oldPassword);
    if (!oldPasswordIsValid) {
      return AuthChangePasswordResponse(
        success: false,
        code: AuthChangePasswordResponseCode.weakOldPassword
      ); 
    }

    newPassword = newPassword.trim();

    bool newPasswordIsValid = Validator.validatePassword(newPassword);
    if (!newPasswordIsValid) {
      return AuthChangePasswordResponse(
        success: false,
        code: AuthChangePasswordResponseCode.weakNewPassword
      ); 
    }

    if (oldPassword == newPassword) {
      return AuthChangePasswordResponse(
        success: false,
        code: AuthChangePasswordResponseCode.samePassword
      );
    }
    
    AuthEmail? auth = await AuthEmail.findSingleRow(session, where: (t) => t.userId.equals(userId));

    if (auth == null) {
      return AuthChangePasswordResponse(
        success: false,
        code: AuthChangePasswordResponseCode.accountNotFound
      );
    }

    String oldPasswordHash = PasswordHashGenerator.generate(oldPassword);

    if (oldPasswordHash != auth.hash) {
      return AuthChangePasswordResponse(
        success: false,
        code: AuthChangePasswordResponseCode.oldPasswordWrong
      );
    }

    auth.hash = PasswordHashGenerator.generate(newPassword);
    await AuthEmail.update(session, auth);

    return AuthChangePasswordResponse(success: true);
  }

  static Future<AuthDeleteAccountResponse> deleteAccount(Session session, String password) async {
    int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      return AuthDeleteAccountResponse(
        success: false,
        code: AuthDeleteAccountResponseCode.notAuthenticated
      );
    }
    
    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) {
      return AuthDeleteAccountResponse(
        success: false,
        code: AuthDeleteAccountResponseCode.weakPassword
      ); 
    }
    
    AuthEmail? auth = await AuthEmail.findSingleRow(session, where: (t) => t.userId.equals(userId));

    if (auth == null) {
      return AuthDeleteAccountResponse(
        success: false,
        code: AuthDeleteAccountResponseCode.accountNotFound
      );
    }

    String passwordHash = PasswordHashGenerator.generate(password);

    if (auth.hash != passwordHash) {
      return AuthDeleteAccountResponse(
        success: false,
        code: AuthDeleteAccountResponseCode.wrongPassword
      );
    }

    await session.auth.signOutUser();

    // TODO: Delete user data from database

    return AuthDeleteAccountResponse(success: true);
  }
}