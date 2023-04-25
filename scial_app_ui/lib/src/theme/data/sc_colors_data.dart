import 'package:flutter/material.dart';

class SCColorsData {

  const SCColorsData({
    required this.accent,
    required this.onAccent,
    required this.background,
    required this.shimmerBackground,
    required this.shimmerLine,
    required this.title1,
    required this.paragraph1,
    required this.ligthButtonTitle,
    required this.appBarBackground,
    required this.appBarButtonBackground,
    required this.appBarButtonForeground,
    required this.appBarTitle,
    required this.imageBackground,
    required this.imageIconForeground,
    required this.textInputBackground,
    required this.textInputIcon,
    required this.textInputText,
    required this.textInputHint,
    required this.pinInputBackground,
    required this.pinInputFocusBorder,
    required this.pinInputErrorBorder,
    required this.pinInputForeground
  });

  factory SCColorsData.light() => const SCColorsData(
    accent: Color(0xFF4299E1),
    onAccent: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    shimmerBackground: Color(0xFFEAEAEA),
    shimmerLine: Color(0xFFFFFFFF),
    title1: Color(0xFF191919),
    paragraph1: Color(0xFF333333),
    ligthButtonTitle: Color(0xFF7F7F7F),
    appBarBackground: Color(0xFFFFFFFF),
    appBarButtonBackground: Color(0xFFDFDFDF),
    appBarButtonForeground: Color(0xFF191919),
    appBarTitle: Color(0xFF191919),
    imageBackground: Color(0xFFEAEAEA),
    imageIconForeground: Color(0xFF191919),
    textInputBackground: Color(0xFFEAEAEA),
    textInputIcon: Color(0xFF7F7F7F),
    textInputText: Color(0xFF191919),
    textInputHint: Color(0xFF7F7F7F),
    pinInputBackground: Color(0xFFEAEAEA),
    pinInputFocusBorder: Color(0xFF4299E1),
    pinInputErrorBorder: Color(0xFFFFEAEE),
    pinInputForeground: Color(0xFF191919)
  );

  factory SCColorsData.dark() => const SCColorsData(
    accent: Color(0xFF3182CE),
    onAccent: Color(0xFFFFFFFF),
    background: Color(0xFF191919),
    shimmerBackground: Color(0xFF333333),
    shimmerLine: Color(0xFF666666),
    title1: Color(0xFFFBFBFB),
    paragraph1: Color(0xFFEAEAEA),
    ligthButtonTitle: Color(0xFF999999),
    appBarBackground: Color(0xFF191919),
    appBarButtonBackground: Color(0xFF4C4C4C),
    appBarButtonForeground: Color(0xFFFBFBFB),
    appBarTitle: Color(0xFFFBFBFB),
    imageBackground: Color(0xFF333333),
    imageIconForeground: Color(0xFFFBFBFB),
    textInputBackground: Color(0xFF333333),
    textInputIcon: Color(0xFF999999),
    textInputText: Color(0xFFFBFBFB),
    textInputHint: Color(0xFF999999),
    pinInputBackground: Color(0xFF333333),
    pinInputFocusBorder: Color(0xFF3182CE),
    pinInputErrorBorder: Color(0xFFF3D4D9),
    pinInputForeground: Color(0xFFFBFBFB)
  );

  final Color accent;
  final Color onAccent;
  final Color background;
  final Color shimmerBackground;
  final Color shimmerLine;
  final Color title1;
  final Color paragraph1;
  final Color ligthButtonTitle;
  final Color appBarBackground;
  final Color appBarButtonBackground;
  final Color appBarButtonForeground;
  final Color appBarTitle;
  final Color imageBackground;
  final Color imageIconForeground;
  final Color textInputBackground;
  final Color textInputIcon;
  final Color textInputText;
  final Color textInputHint;
  final Color pinInputBackground;
  final Color pinInputFocusBorder;
  final Color pinInputErrorBorder;
  final Color pinInputForeground;
}