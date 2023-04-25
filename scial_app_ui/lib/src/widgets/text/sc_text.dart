import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

enum SCTextLevel {
  title1,
  paragraph1,
  buttonTitle,
  lightButtonTitle,
  appBarTitle
}

class SCText extends StatelessWidget {

  const SCText.title1(
    this.data,
  {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.level = SCTextLevel.title1
  });

  const SCText.paragraph1(
    this.data,
  {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.level = SCTextLevel.paragraph1
  });

  const SCText.buttonTitle(
    this.data,
  {
    super.key,
    this.color,
    this.level = SCTextLevel.buttonTitle
  })
  : maxLines = 1,
    overflow = TextOverflow.ellipsis,
    textAlign = TextAlign.center;

  const SCText.lightButtonTitle(
    this.data,
  {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.level = SCTextLevel.lightButtonTitle
  });

  const SCText.appBarTitle(
    this.data,
  {
    super.key,
    this.color,
    this.level = SCTextLevel.appBarTitle
  })
  : textAlign = null,
    maxLines = 1,
    overflow = TextOverflow.ellipsis;

  final String data;
  final SCTextLevel level;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final SCThemeData theme = SCTheme.of(context);

    late final Color newColor;

    if (color == null) {
      switch (level) {
        case SCTextLevel.title1:
          newColor = theme.colors.title1;
          break;
        case SCTextLevel.paragraph1:
          newColor = theme.colors.paragraph1;
          break;
        case SCTextLevel.buttonTitle:
          newColor = theme.colors.onAccent;
          break;
        case SCTextLevel.lightButtonTitle:
          newColor = theme.colors.ligthButtonTitle;
          break;
        case SCTextLevel.appBarTitle:
          newColor = theme.colors.appBarTitle;
          break;
      }
    }

    final style = () {
      switch (level) {
        case SCTextLevel.title1:
          return theme.typography.title1;
        case SCTextLevel.paragraph1: 
          return theme.typography.paragraph1;
        case SCTextLevel.buttonTitle:
          return theme.typography.buttonTitle;
        case SCTextLevel.lightButtonTitle:
          return theme.typography.ligthButtonTitle;
        case SCTextLevel.appBarTitle:
          return theme.typography.appBarTitle;
      }
    }();

    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: style.copyWith(color: color ?? newColor)
    );
  }
}