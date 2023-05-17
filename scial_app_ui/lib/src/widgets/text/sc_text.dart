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
  dialogButton,
  sheetTitle,
  userText,
  emptyBadges,
  editUserIsPrivate,
  userFriendshipsUserName,
  userFriendshipsSince,
  userFriendshipsEmptyBadges,
  eventListTitle,
  eventListDistance,
  eventListLocation,
  eventListTime,
  imageStackExtraCount,
  eventNoGuests,
  notificationsText,
  notificationText,
  notificationTime,
  notificationsFriendRequestNotFound,
  notificationsFriendRequestUserName,
  notificationsFriendRequestText,
  notificationsFriendRequestAlreadyAnswered,
  scialDayCTAText,
  scialDayCTAButtonForeground,
  discoverFiltersTitle,
  discoverFiltersDistance
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

  const SCText.sheetTitle(
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
    level = SCTextLevel.sheetTitle;

  const SCText.userText(
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
    level = SCTextLevel.userText;

  const SCText.emptyBadges(
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
    level = SCTextLevel.emptyBadges;

  const SCText.editUserIsPrivate(
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
    level = SCTextLevel.editUserIsPrivate;

  const SCText.userFriendshipsUserName(
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
    level = SCTextLevel.userFriendshipsUserName;

  const SCText.userFriendshipsEmptyBadges(
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
    level = SCTextLevel.userFriendshipsEmptyBadges;

  const SCText.userFriendshipsSince(
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
    level = SCTextLevel.userFriendshipsSince;

  const SCText.eventListTitle(
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
    level = SCTextLevel.eventListTitle;

  const SCText.eventListDistance(
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
    level = SCTextLevel.eventListDistance;

  const SCText.eventListLocation(
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
    level = SCTextLevel.eventListLocation;

  const SCText.eventListTime(
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
    level = SCTextLevel.eventListTime;

  const SCText.imageStackExtraCount(
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
    level = SCTextLevel.imageStackExtraCount;

  const SCText.eventNoGuests(
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
    level = SCTextLevel.eventNoGuests;

  const SCText.notificationsText(
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
    level = SCTextLevel.notificationsText;

  const SCText.notificationText(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = 3,
    overflow = TextOverflow.ellipsis,
    textAlign = null,
    level = SCTextLevel.notificationText;

  const SCText.notificationTime(
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
    level = SCTextLevel.notificationTime;

  const SCText.notificationsFriendRequestNotFound(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = null,
    overflow = TextOverflow.ellipsis,
    textAlign = TextAlign.center,
    level = SCTextLevel.notificationsFriendRequestNotFound;

  const SCText.notificationsFriendRequestAlreadyAnswered(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = null,
    overflow = TextOverflow.ellipsis,
    textAlign = TextAlign.center,
    level = SCTextLevel.notificationsFriendRequestAlreadyAnswered;

  const SCText.notificationsFriendRequestUserName(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = null,
    overflow = TextOverflow.ellipsis,
    textAlign = TextAlign.center,
    level = SCTextLevel.notificationsFriendRequestUserName;

  const SCText.notificationsFriendRequestText(
    this.text,
    {
      super.key,
      this.color
    }
  ) 
  : height = null,
    style = null,
    maxLines = null,
    overflow = TextOverflow.ellipsis,
    textAlign = TextAlign.center,
    level = SCTextLevel.notificationsFriendRequestText;

  const SCText.scialDayCTAText(
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
    level = SCTextLevel.scialDayCTAText;

  const SCText.scialDayCTAButtonForeground(
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
    level = SCTextLevel.scialDayCTAButtonForeground;

  const SCText.discoverFiltersDistance(
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
    textAlign = TextAlign.right,
    level = SCTextLevel.discoverFiltersDistance;

  const SCText.discoverFiltersTitle(
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
    level = SCTextLevel.discoverFiltersTitle;

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
        case SCTextLevel.sheetTitle: return theme.colors.sheetTitleForeground;
        case SCTextLevel.userText: return theme.colors.userText;
        case SCTextLevel.emptyBadges: return theme.colors.emptyBadges;
        case SCTextLevel.editUserIsPrivate: return theme.colors.editUserIsPrivate;
        case SCTextLevel.userFriendshipsUserName: return theme.colors.userFriendshipsUserName;
        case SCTextLevel.userFriendshipsSince: return theme.colors.userFriendshipsSince;
        case SCTextLevel.userFriendshipsEmptyBadges: return theme.colors.userFriendshipsEmptyBadges;
        case SCTextLevel.eventListTitle: return theme.colors.eventListTitle;
        case SCTextLevel.eventListDistance: return theme.colors.eventListDistance;
        case SCTextLevel.eventListLocation: return theme.colors.eventListLocation;
        case SCTextLevel.eventListTime: return theme.colors.eventListTime;
        case SCTextLevel.imageStackExtraCount: return theme.colors.imageStackExtraCount;
        case SCTextLevel.eventNoGuests: return theme.colors.eventNoGuests;
        case SCTextLevel.notificationsText: return theme.colors.notificationsText;
        case SCTextLevel.notificationText: return theme.colors.notificationText;
        case SCTextLevel.notificationTime: return theme.colors.notificationTime;
        case SCTextLevel.notificationsFriendRequestNotFound: return theme.colors.notificationsFriendRequestNotFound;
        case SCTextLevel.notificationsFriendRequestUserName: return theme.colors.notificationsFriendRequestUserName;
        case SCTextLevel.notificationsFriendRequestText: return theme.colors.notificationsFriendRequestText;
        case SCTextLevel.notificationsFriendRequestAlreadyAnswered: return theme.colors.notificationsFriendRequestAlreadyAnswered;
        case SCTextLevel.scialDayCTAText: return theme.colors.scialDayCTAText;
        case SCTextLevel.scialDayCTAButtonForeground: return theme.colors.scialDayCTAButtonForeground;
        case SCTextLevel.discoverFiltersTitle: return theme.colors.discoverFiltersTitle;
        case SCTextLevel.discoverFiltersDistance: return theme.colors.discoverFiltersDistance;
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
        case SCTextLevel.sheetTitle:
          return theme.typography.sheetTitle;
        case SCTextLevel.userText:
          return theme.typography.userText;
        case SCTextLevel.emptyBadges:
          return theme.typography.emptyBadges;
        case SCTextLevel.editUserIsPrivate:
          return theme.typography.editUserIsPrivate;
        case SCTextLevel.userFriendshipsUserName:
          return theme.typography.userFriendshipsUserName;
        case SCTextLevel.userFriendshipsSince:
          return theme.typography.userFriendshipsSince;
        case SCTextLevel.userFriendshipsEmptyBadges:
          return theme.typography.userFriendshipsEmptyBadges;
        case SCTextLevel.eventListTitle:
          return theme.typography.eventListTitle;
        case SCTextLevel.eventListDistance:
          return theme.typography.eventListDistance;
        case SCTextLevel.eventListLocation:
          return theme.typography.eventListLocation;
        case SCTextLevel.eventListTime:
          return theme.typography.eventListTime;
        case SCTextLevel.imageStackExtraCount:
          return theme.typography.imageStackExtraCount;
        case SCTextLevel.eventNoGuests:
          return theme.typography.eventNoGuests;
        case SCTextLevel.notificationsText:
          return theme.typography.notificationsText;
        case SCTextLevel.notificationText:
          return theme.typography.notificationText;
        case SCTextLevel.notificationTime:
          return theme.typography.notificationTime;
        case SCTextLevel.notificationsFriendRequestNotFound:
          return theme.typography.notificationsFriendRequestNotFound;
        case SCTextLevel.notificationsFriendRequestUserName:
          return theme.typography.notificationsFriendRequestUserName;
        case SCTextLevel.notificationsFriendRequestText:
          return theme.typography.notificationsFriendRequestText;
        case SCTextLevel.notificationsFriendRequestAlreadyAnswered: 
          return theme.typography.notificationsFriendRequestAlreadyAnswered;
        case SCTextLevel.scialDayCTAText:
          return theme.typography.scialDayCTAText;
        case SCTextLevel.scialDayCTAButtonForeground:
          return theme.typography.scialDayCTAButtonForeground;
        case SCTextLevel.discoverFiltersTitle:
          return theme.typography.discoverFiltersTitle;
        case SCTextLevel.discoverFiltersDistance:
          return theme.typography.discoverFiltersDistance;
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