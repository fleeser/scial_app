import 'package:flutter/material.dart';

class Responsive {
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;
  static double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
  static double leftPadding(BuildContext context) => MediaQuery.of(context).padding.left;
  static double rightPadding(BuildContext context) => MediaQuery.of(context).padding.right;

  static bool isKeyboardVisible(BuildContext context) => MediaQuery.of(context).viewInsets.bottom > 0.0;
  static double keyboardHeight(BuildContext context) => MediaQuery.of(context).viewInsets.bottom;
}