import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';

class PasswordHashGenerator {

  static String generate(String password) {
    String salt = Serverpod.instance!.getPassword('authEmailPasswordSalt')!;
    return sha256.convert(utf8.encode(password + salt)).toString();
  }
}