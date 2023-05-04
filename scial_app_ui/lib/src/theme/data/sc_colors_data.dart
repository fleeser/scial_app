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
    required this.sliverAppBarExpandedBackground,
    required this.sliverAppBarCollapsedBackground,
    required this.sliverAppBarExpandedTitle,
    required this.sliverAppBarCollapsedTitle,
    required this.bottomBarBackground,
    required this.bottomBarPrimaryBackground,
    required this.bottomBarPrimaryForeground,
    required this.bottomBarSecondaryUnselectedForeground,
    required this.bottomBarSecondarySelectedForeground,
    required this.tabBarBackground,
    required this.tabBarSelectedBackground,
    required this.tabBarUnselectedForeground,
    required this.tabBarSelectedForeground,
    required this.imageBackground,
    required this.imageIconForeground,
    required this.textInputBackground,
    required this.textInputIcon,
    required this.textInputText,
    required this.textInputHint,
    required this.pinInputBackground,
    required this.pinInputFocusBorder,
    required this.pinInputErrorBorder,
    required this.pinInputForeground,
    required this.ratingNameForeground,
    required this.ratingTimeForeground,
    required this.ratingTextForeground,
    required this.ratingRatingTitleForeground,
    required this.ratingIndicatorForeground,
    required this.ratingIndicatorHostBackground,
    required this.ratingIndicatorGuestBackground,
    required this.dialogBackground,
    required this.dialogButtonPrimaryBackground,
    required this.dialogButtonPrimaryForeground,
    required this.dialogButtonSecondaryBackground,
    required this.dialogButtonSecondaryForeground,
    required this.dialogTitleForeground,
    required this.dialogTextForeground
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
    sliverAppBarExpandedBackground: Color(0xFFEAEAEA),
    sliverAppBarCollapsedBackground: Color(0xFFFFFFFF),
    sliverAppBarExpandedTitle: Color(0xFFFFFFFF),
    sliverAppBarCollapsedTitle: Color(0xFF191919),
    bottomBarBackground: Color(0xFFFFFFFF),
    bottomBarPrimaryBackground: Color(0xFF4299E1),
    bottomBarPrimaryForeground: Color(0xFFFFFFFF),
    bottomBarSecondaryUnselectedForeground: Color(0xFF7F7F7F),
    bottomBarSecondarySelectedForeground: Color(0xFF191919),
    tabBarBackground: Color(0xFFFFFFFF),
    tabBarSelectedBackground: Color(0xFF4299E1),
    tabBarUnselectedForeground: Color(0xFF7F7F7F),
    tabBarSelectedForeground: Color(0xFFFFFFFF),
    imageBackground: Color(0xFFEAEAEA),
    imageIconForeground: Color(0xFF191919),
    textInputBackground: Color(0xFFEAEAEA),
    textInputIcon: Color(0xFF7F7F7F),
    textInputText: Color(0xFF191919),
    textInputHint: Color(0xFF7F7F7F),
    pinInputBackground: Color(0xFFEAEAEA),
    pinInputFocusBorder: Color(0xFF4299E1),
    pinInputErrorBorder: Color(0xFFFFEAEE),
    pinInputForeground: Color(0xFF191919),
    ratingNameForeground: Color(0xFF191919),
    ratingTimeForeground: Color(0xFF7F7F7F),
    ratingTextForeground: Color(0xFF191919),
    ratingRatingTitleForeground: Color(0xFF191919),
    ratingIndicatorForeground: Color(0xFFFFFFFF),
    ratingIndicatorHostBackground: Color(0xFF8D8DFF),
    ratingIndicatorGuestBackground: Color(0xFFED8936),
    dialogBackground: Color(0xFFFFFFFF),
    dialogButtonPrimaryBackground: Color(0xFF4299E1),
    dialogButtonPrimaryForeground: Color(0xFFFFFFFF),
    dialogButtonSecondaryBackground: Color(0xFFDFDFDF),
    dialogButtonSecondaryForeground: Color(0xFF191919),
    dialogTitleForeground: Color(0xFF191919),
    dialogTextForeground: Color(0xFF7F7F7F)
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
    sliverAppBarExpandedBackground: Color(0xFF333333),
    sliverAppBarCollapsedBackground: Color(0xFF191919),
    sliverAppBarExpandedTitle: Color(0xFFFFFFFF),
    sliverAppBarCollapsedTitle: Color(0xFFFBFBFB),
    bottomBarBackground: Color(0xFF191919),
    bottomBarPrimaryBackground: Color(0xFF3182CE),
    bottomBarPrimaryForeground: Color(0xFFFFFFFF),
    bottomBarSecondaryUnselectedForeground: Color(0xFF999999),
    bottomBarSecondarySelectedForeground: Color(0xFFFBFBFB),
    tabBarBackground: Color(0xFF191919),
    tabBarSelectedBackground: Color(0xFF3182CE),
    tabBarUnselectedForeground: Color(0xFF999999),
    tabBarSelectedForeground: Color(0xFFFFFFFF),
    imageBackground: Color(0xFF333333),
    imageIconForeground: Color(0xFFFBFBFB),
    textInputBackground: Color(0xFF333333),
    textInputIcon: Color(0xFF999999),
    textInputText: Color(0xFFFBFBFB),
    textInputHint: Color(0xFF999999),
    pinInputBackground: Color(0xFF333333),
    pinInputFocusBorder: Color(0xFF3182CE),
    pinInputErrorBorder: Color(0xFFF3D4D9),
    pinInputForeground: Color(0xFFFBFBFB),
    ratingNameForeground: Color(0xFFFBFBFB),
    ratingTimeForeground: Color(0xFF999999),
    ratingTextForeground: Color(0xFFFBFBFB),
    ratingRatingTitleForeground: Color(0xFFFBFBFB),
    ratingIndicatorForeground: Color(0xFFFFFFFF),
    ratingIndicatorHostBackground: Color(0xFF5D5DFF),
    ratingIndicatorGuestBackground: Color(0xFFDD6B20),
    dialogBackground: Color(0xFF191919),
    dialogButtonPrimaryBackground: Color(0xFF3182CE),
    dialogButtonPrimaryForeground: Color(0xFFFFFFFF),
    dialogButtonSecondaryBackground: Color(0xFF4C4C4C),
    dialogButtonSecondaryForeground: Color(0xFFFBFBFB),
    dialogTitleForeground: Color(0xFFFBFBFB),
    dialogTextForeground: Color(0xFF999999)
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
  final Color sliverAppBarExpandedBackground;
  final Color sliverAppBarCollapsedBackground;
  final Color sliverAppBarExpandedTitle;
  final Color sliverAppBarCollapsedTitle;
  final Color bottomBarBackground;
  final Color bottomBarPrimaryBackground;
  final Color bottomBarPrimaryForeground;
  final Color bottomBarSecondaryUnselectedForeground;
  final Color bottomBarSecondarySelectedForeground;
  final Color tabBarBackground;
  final Color tabBarSelectedBackground;
  final Color tabBarUnselectedForeground;
  final Color tabBarSelectedForeground;
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
  final Color ratingNameForeground;
  final Color ratingTimeForeground;
  final Color ratingTextForeground;
  final Color ratingRatingTitleForeground;
  final Color ratingIndicatorForeground;
  final Color ratingIndicatorHostBackground;
  final Color ratingIndicatorGuestBackground;
  final Color dialogBackground;
  final Color dialogButtonPrimaryBackground;
  final Color dialogButtonPrimaryForeground;
  final Color dialogButtonSecondaryBackground;
  final Color dialogButtonSecondaryForeground;
  final Color dialogTitleForeground;
  final Color dialogTextForeground;
}