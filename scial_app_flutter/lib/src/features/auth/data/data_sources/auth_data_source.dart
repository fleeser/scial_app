abstract class AuthDataSource {
  Future<void> signUp(String email, String password);
  Future<({ int keyId, String key, int userId })> signUpVerification(String email, String verificationCode);
  Future<void> forgotPassword(String email);
  Future<void> forgotPasswordVerification(String email, String verificationCode);
  Future<({ int keyId, String key, int userId })?> forgotPasswordSubmission(String email, String verificationCode, String password);
  Future<({ int keyId, String key, int userId })> signIn(String email, String password);
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<void> deleteAccount(String password);
}