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

  const SCText(
    this.text,
    {
      super.key,
      this.color,
      this.maxLines,
      this.overflow,
      this.textAlign,
      this.style
    }
  )
  : level = null,
    height = null;

  const SCText.title1(
    this.text,
    {
      super.key,
      this.color,
      this.maxLines,
      this.overflow,
      this.textAlign,
      this.height
    }
  )
  : style = null,
    level = SCTextLevel.title1;

  const SCText.paragraph1(
    this.text,
    {
      super.key,
      this.color,
      this.maxLines,
      this.overflow,
      this.textAlign,
      this.height
    }
  )
  : style = null,
    level = SCTextLevel.paragraph1;

  const SCText.buttonTitle(
    this.text,
    {
      super.key,
      this.color,
      this.height
    }
  )
    : style = null,
      maxLines = 1,
      overflow = TextOverflow.ellipsis,
      textAlign = TextAlign.center,
      level = SCTextLevel.buttonTitle;

  const SCText.lightButtonTitle(
    this.text,
  {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.height
  })
  : style = null,
    level = SCTextLevel.lightButtonTitle;

  const SCText.appBarTitle(
    this.text,
  {
    super.key,
    this.color,
    this.height
  })
  : style = null,
    textAlign = null,
    maxLines = 1,
    overflow = TextOverflow.ellipsis,
    level = SCTextLevel.appBarTitle;

  final String text;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextStyle? style;
  final SCTextLevel? level;
  final double? height;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    Color? color() {
      switch (level) {
        case SCTextLevel.title1: return theme.colors.title1;
        case SCTextLevel.paragraph1: return theme.colors.paragraph1;
        case SCTextLevel.buttonTitle: return theme.colors.onAccent;
        case SCTextLevel.lightButtonTitle: return theme.colors.ligthButtonTitle;
        case SCTextLevel.appBarTitle: return theme.colors.appBarTitle;
        default: return null;
      }
    }

    TextStyle? style() {
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
        default: return null;
      }
    }

    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: level != null
        ? style()!.copyWith(
          color: this.color ?? color(),
          height: height
        )
        : this.style
    );
  }
}