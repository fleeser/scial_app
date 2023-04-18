abstract class AuthRepository {
  Future<void> signUp(String email, String password);
  Future<void> signUpVerification(String email, String verificationCode);
  Future<void> forgotPassword(String email);
  Future<void> forgotPasswordVerification(String email, String verificationCode);
  Future<void> forgotPasswordSubmission(String email, String verificationCode, String password);
  Future<void> signIn(String email, String password);
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<void> deleteAccount(String password);
  Future<void> signOut();
}