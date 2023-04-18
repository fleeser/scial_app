import 'dart:math';

extension RandomExtension on Random {

  String nextString({
    int length = 16,
    String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'
  }) {
    return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(nextInt(chars.length))));
  }
  
}