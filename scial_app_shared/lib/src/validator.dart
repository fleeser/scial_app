class Validator {
  
  static bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static validatePassword(String password) {
    return password.length >= 6 && password.length <= 32;
  }

  static bool validateVerificationCode(String verificationCode) {
    return RegExp(r'^[0-9]{6}$').hasMatch(verificationCode);
  }

  static bool validateName(String name) {
    return !name.startsWith('#') && name.length >= 2 && name.length <= 32;
  }

  static bool validateUniqueCode(String uniqueCode) {
    return RegExp(r'^[A-Z0-9]{8}$').hasMatch(uniqueCode);
  }
}