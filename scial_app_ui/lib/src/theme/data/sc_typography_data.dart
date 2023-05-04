import 'package:flutter/widgets.dart';

class SCTypographyData {

  const SCTypographyData({
    required this.title1,
    required this.paragraph1,
    required this.buttonTitle,
    required this.ligthButtonTitle,
    required this.appBarTitle,
    required this.sliverAppBarExpandedTitle,
    required this.sliverAppBarCollapsedTitle,
    required this.tabBarSelectedTitle,
    required this.tabBarUnselectedTitle,
    required this.textInputFieldText,
    required this.textInputFieldHint,
    required this.pinInput,
    required this.ratingName,
    required this.ratingTime,
    required this.ratingText,
    required this.ratingRatingTitle,
    required this.ratingIndicator,
    required this.dialogTitle,
    required this.dialogText,
    required this.dialogButton
  });

  factory SCTypographyData.regular() => const SCTypographyData(
    title1: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 28.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    paragraph1: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    buttonTitle: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    ligthButtonTitle: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    appBarTitle: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    sliverAppBarExpandedTitle: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
      decoration: TextDecoration.none,
      height: 1.0,
      package: 'scial_app_ui'
    ),
    sliverAppBarCollapsedTitle: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      decoration: TextDecoration.none,
      height: 1.0,
      package: 'scial_app_ui'
    ),
    textInputFieldText: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    textInputFieldHint: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    pinInput: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 22,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    tabBarSelectedTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    tabBarUnselectedTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    ratingName: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    ratingTime: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    ratingText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    ratingRatingTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    ratingIndicator: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    dialogTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    dialogText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    dialogButton: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    )
  );

  final TextStyle title1;
  final TextStyle paragraph1;
  final TextStyle buttonTitle;
  final TextStyle ligthButtonTitle;
  final TextStyle appBarTitle;
  final TextStyle sliverAppBarExpandedTitle;
  final TextStyle sliverAppBarCollapsedTitle;
  final TextStyle tabBarSelectedTitle;
  final TextStyle tabBarUnselectedTitle;
  final TextStyle textInputFieldText;
  final TextStyle textInputFieldHint;
  final TextStyle pinInput;
  final TextStyle ratingName;
  final TextStyle ratingTime;
  final TextStyle ratingText;
  final TextStyle ratingRatingTitle;
  final TextStyle ratingIndicator;
  final TextStyle dialogTitle;
  final TextStyle dialogText;
  final TextStyle dialogButton;
}