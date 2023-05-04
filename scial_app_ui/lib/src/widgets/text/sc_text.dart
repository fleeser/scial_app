import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

enum SCTextLevel {
  title1,
  paragraph1,
  buttonTitle,
  lightButtonTitle,
  appBarTitle,
  ratingName,
  ratingTime,
  ratingText,
  ratingRatingTitle,
  ratingIndicator,
  dialogTitle,
  dialogText,
  dialogButton
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

  const SCText.ratingName(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = 1,
    overflow = TextOverflow.ellipsis,
    textAlign = null,
    level = SCTextLevel.ratingName;

  const SCText.ratingTime(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = 1,
    overflow = TextOverflow.ellipsis,
    textAlign = null,
    level = SCTextLevel.ratingTime;

  const SCText.ratingText(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = null,
    overflow = null,
    textAlign = null,
    level = SCTextLevel.ratingText;

  const SCText.ratingRatingTitle(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = 1,
    overflow = TextOverflow.ellipsis,
    textAlign = null,
    level = SCTextLevel.ratingRatingTitle;

  const SCText.ratingIndicator(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = 1,
    overflow = TextOverflow.ellipsis,
    textAlign = TextAlign.center,
    level = SCTextLevel.ratingIndicator;
  
  const SCText.dialogTitle(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = null,
    overflow = null,
    textAlign = TextAlign.center,
    level = SCTextLevel.dialogTitle;

  const SCText.dialogText(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = null,
    overflow = null,
    textAlign = TextAlign.center,
    level = SCTextLevel.dialogText;
  
  const SCText.dialogButton(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = 1,
    overflow = TextOverflow.ellipsis,
    textAlign = TextAlign.center,
    level = SCTextLevel.dialogButton;

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
        case SCTextLevel.ratingName: return theme.colors.ratingNameForeground;
        case SCTextLevel.ratingTime: return theme.colors.ratingTimeForeground;
        case SCTextLevel.ratingText: return theme.colors.ratingTextForeground;
        case SCTextLevel.ratingRatingTitle: return theme.colors.ratingRatingTitleForeground;
        case SCTextLevel.ratingIndicator: return theme.colors.ratingIndicatorForeground;
        case SCTextLevel.dialogTitle: return theme.colors.dialogTitleForeground;
        case SCTextLevel.dialogText: return theme.colors.dialogTextForeground;
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
        case SCTextLevel.ratingName:
          return theme.typography.ratingName;
        case SCTextLevel.ratingTime:
          return theme.typography.ratingTime;
        case SCTextLevel.ratingText:
          return theme.typography.ratingText;
        case SCTextLevel.ratingRatingTitle:
          return theme.typography.ratingRatingTitle;
        case SCTextLevel.ratingIndicator:
          return theme.typography.ratingIndicator;
        case SCTextLevel.dialogTitle:
          return theme.typography.dialogTitle;
        case SCTextLevel.dialogText:
          return theme.typography.dialogText;
        case SCTextLevel.dialogButton:
          return theme.typography.dialogButton;
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