import 'dart:math';

import 'package:scial_app_server/src/util/random_extension.dart';

class UniqueCodeGenerator {

  static String generate() {
    return Random().nextString(length: 6, chars: '0123456789');
  }
}