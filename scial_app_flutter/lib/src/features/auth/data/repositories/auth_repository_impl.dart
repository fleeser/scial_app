import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/exceptions/app_exception.dart';
import 'package:scial_app_flutter/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:scial_app_flutter/src/features/auth/data/data_sources/auth_data_source_impl.dart';
import 'package:scial_app_flutter/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_shared/scial_app_shared.dart';

part 'auth_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dataSource = ref.read(authDataSourceProvider);
  final authRepository = AuthRepositoryImpl(dataSource);
  ref.onDispose(() async => await KeyValueStorage.closeAuthBox());
  return authRepository;
}

class AuthRepositoryImpl implements AuthRepository {

  const AuthRepositoryImpl(this.dataSource);

  final AuthDataSource dataSource;

  @override
  Future<void> signUp(String email, String password) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) throw const AppException.authSignUpInvalidEmail();

    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) throw const AppException.authSignUpWeakPassword();

    return await dataSource.signUp(email, password);
  }

  @override
  Future<void> signUpVerification(String email, String verificationCode) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) throw const AppException.authSignUpVerificationInvalidEmail();

    verificationCode = verificationCode.trim();
    bool verificationCodeIsValid = Validator.validateVerificationCode(verificationCode);
    if (!verificationCodeIsValid) throw const AppException.authSignUpVerificationInvalidVerificationCode();

    final ({ int keyId, String key, int userId }) result = await dataSource.signUpVerification(email, verificationCode);

    await KeyValueStorage.storeAuthInfo(result.keyId, result.key, result.userId);
  }

  @override
  Future<void> forgotPassword(String email) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) throw const AppException.authForgotPasswordInvalidEmail();

    return await dataSource.forgotPassword(email);
  }

  @override
  Future<void> forgotPasswordVerification(String email, String verificationCode) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) throw const AppException.authForgotPasswordVerificationInvalidEmail();

    verificationCode = verificationCode.trim();
    bool verificationCodeIsValid = Validator.validateVerificationCode(verificationCode);
    if (!verificationCodeIsValid) throw const AppException.authForgotPasswordVerificationInvalidVerificationCode();

    return await dataSource.forgotPasswordVerification(email, verificationCode);
  }

  @override
  Future<void> forgotPasswordSubmission(String email, String verificationCode, String password) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) throw const AppException.authForgotPasswordSubmissionInvalidEmail();

    verificationCode = verificationCode.trim();
    bool verificationCodeIsValid = Validator.validateVerificationCode(verificationCode);
    if (!verificationCodeIsValid) throw const AppException.authForgotPasswordSubmissionInvalidVerificationCode();

    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) throw const AppException.authForgotPasswordSubmissionWeakPassword();

    final ({ int keyId, String key, int userId })? result = await dataSource.forgotPasswordSubmission(email, verificationCode, password);

    if (result != null) {
      await KeyValueStorage.storeAuthInfo(result.keyId, result.key, result.userId);
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    email = email.trim().toLowerCase();
    bool emailIsValid = Validator.validateEmail(email);
    if (!emailIsValid) throw const AppException.authSignInInvalidEmail();

    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) throw const AppException.authSignInWeakPassword();

    final ({ int keyId, String key, int userId }) result = await dataSource.signIn(email, password);

    await KeyValueStorage.storeAuthInfo(result.keyId, result.key, result.userId);
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    oldPassword = oldPassword.trim();
    bool oldPasswordIsValid = Validator.validatePassword(oldPassword);
    if (!oldPasswordIsValid) throw const AppException.authChangePasswordWeakOldPassword();

    newPassword = newPassword.trim();
    bool newPasswordIsValid = Validator.validatePassword(newPassword);
    if (!newPasswordIsValid) throw const AppException.authChangePasswordWeakNewPassword();

    return await dataSource.changePassword(oldPassword, newPassword);
  }

  @override
  Future<void> deleteAccount(String password) async {
    password = password.trim();
    bool passwordIsValid = Validator.validatePassword(password);
    if (!passwordIsValid) throw const AppException.authDeleteAccountWeakPassword();

    await dataSource.deleteAccount(password);

    await KeyValueStorage.removeAuthInfo();
  }

  @override
  Future<void> signOut() async {
    // TODO
    await KeyValueStorage.removeAuthInfo();
  }
}