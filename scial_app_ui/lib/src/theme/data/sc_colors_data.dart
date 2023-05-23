import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_palette.dart';

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
    required this.textInputFieldBackground,
    required this.textInputBoxBackground,
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
    required this.dialogTextForeground,
    required this.sheetBackground,
    required this.sheetTitleForeground,
    required this.sheetCancelButtonBackground,
    required this.sheetCancelButtonForeground,
    required this.switchActiveBackground,
    required this.switchInactiveBackground,
    required this.switchActiveForeground,
    required this.switchInactiveForeground,
    required this.profileErrorForeground,
    required this.userText,
    required this.emptyBadges,
    required this.editUserIsPrivate,
    required this.userFriendshipsUserName,
    required this.userFriendshipsSince,
    required this.userFriendshipsEmptyBadges,
    required this.eventListIcon,
    required this.eventListTitle,
    required this.eventListDistance,
    required this.eventListLocation,
    required this.eventListTime,
    required this.imageStackExtraCount,
    required this.eventNoGuests,
    required this.notificationsText,
    required this.notificationText,
    required this.notificationTime,
    required this.notificationsFriendRequestNotFound,
    required this.notificationsFriendRequestAlreadyAnswered,
    required this.notificationsFriendRequestUserName,
    required this.notificationsFriendRequestText,
    required this.discoverFiltersTitle,
    required this.discoverFiltersDistance,
    required this.inactiveTrackColor,
    required this.activeTrackColor,
    required this.thumbColor,
    required this.eventNoGuestsBackground,

    // Center Text

    required this.centerText,

    // Sheet

    required this.sheetSubTitle,

    // App Bar

    required this.appBarSearchBarBackground,
    required this.appBarSearchBarDeleteIcon,
    required this.appBarSearchBarSearchIcon,
    required this.appBarSearchBarCursor,
    required this.appBarSearchBarHint,
    required this.appBarSearchBarText,

    // Circular Selector

    required this.circularSelectorBackground,
    required this.circularSelectorSelectedBorder,

    // CTA

    required this.ctaBackground,
    required this.ctaText,
    required this.ctaButtonBackground,
    required this.ctaButtonText,

    // Popup

    required this.popupButtonBackground,
    required this.popupButtonIcon,
    required this.popupButtonText,

    // Location

    required this.locationListItemText,

    // Editable Users

    required this.editableUsersButtonBackground,
    required this.editableUsersButtonIcon,
    required this.editableUsersText,

    // Settings

    required this.settingsSectionTitle,
    required this.settingsSectionItemIcon,
    required this.settingsSectionItemTitle,

    // Selectable List

    required this.selectableListItemIconSelected,
    required this.selectableListItemIconUnselected,
    required this.selectableListItemTitleSelected,
    required this.selectableListItemTitleUnselected,
    required this.selectableListItemIndicatorSelected,
    required this.selectableListItemIndicatorUnselected,
    required this.selectableLangListItemTitleSelected,
    required this.selectableLangListItemTitleUnselected,
    required this.selectableLangListItemIndicatorSelected,
    required this.selectableLangListItemIndicatorUnselected
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
    textInputFieldBackground: Color(0xFFEAEAEA),
    textInputBoxBackground: Color(0xFFEAEAEA),
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
    dialogTextForeground: Color(0xFF7F7F7F),
    sheetBackground: Color(0xFFFFFFFF),
    sheetTitleForeground: Color(0xFF191919),
    sheetCancelButtonBackground: Color(0xFFDFDFDF),
    sheetCancelButtonForeground: Color(0xFF191919),
    switchActiveBackground: Color(0xFF4299E1),
    switchInactiveBackground: Color(0xFFEAEAEA),
    switchActiveForeground: Color(0xFFFFFFFF),
    switchInactiveForeground: Color(0xFF7F7F7F),
    profileErrorForeground: Color(0xFF191919),
    userText: Color(0xFF191919),
    emptyBadges: Color(0xFF191919),
    editUserIsPrivate: Color(0xFF191919),
    userFriendshipsUserName: Color(0xFF191919),
    userFriendshipsSince: Color(0xFF7F7F7F),
    userFriendshipsEmptyBadges: Color(0xFF191919),
    eventListIcon: Color(0xFF7F7F7F),
    eventListTitle: Color(0xFF191919),
    eventListDistance: Color(0xFF7F7F7F),
    eventListLocation: Color(0xFF7F7F7F),
    eventListTime: Color(0xFF7F7F7F),
    imageStackExtraCount: Color(0xFF191919),
    eventNoGuests: Color(0xFFFFFFFF),
    eventNoGuestsBackground: Color(0xFFED8936),
    notificationsText: Color(0xFF191919),
    notificationText: Color(0xFF191919),
    notificationTime: Color(0xFF7F7F7F),
    notificationsFriendRequestNotFound: Color(0xFF191919),
    notificationsFriendRequestUserName: Color(0xFF191919),
    notificationsFriendRequestText: Color(0xFF191919),
    notificationsFriendRequestAlreadyAnswered: Color(0xFF191919),
    discoverFiltersTitle: Color(0xFF191919),
    inactiveTrackColor: Color(0xFF7F7F7F),
    activeTrackColor: Color(0xFF4299E1),
    thumbColor: Color(0xFF4299E1),
    discoverFiltersDistance: Color(0xFF191919),

    // Center Text

    centerText: SCPalette.gray900,

    // Sheet

    sheetSubTitle: SCPalette.gray900,

    // App Bar

    appBarSearchBarBackground: SCPalette.gray300,
    appBarSearchBarDeleteIcon: SCPalette.gray900,
    appBarSearchBarSearchIcon: SCPalette.gray900,
    appBarSearchBarCursor: SCPalette.gray500,
    appBarSearchBarHint: SCPalette.gray500,
    appBarSearchBarText: SCPalette.gray900,

    // Circular Selector

    circularSelectorBackground: Color(0xFF7F7F7F),
    circularSelectorSelectedBorder: Color(0xFF4299E1),

    // CTA

    ctaBackground: Color(0xFF4299E1),
    ctaText: Color(0xFFFFFFFF),
    ctaButtonBackground: Color(0xFFFFFFFF),
    ctaButtonText: Color(0xFF191919),

    // Popup

    popupButtonBackground: SCPalette.gray300,
    popupButtonIcon: SCPalette.gray900,
    popupButtonText: SCPalette.gray900,

    // Location

    locationListItemText: SCPalette.gray900,

    // Editable Users

    editableUsersButtonBackground: SCPalette.gray300,
    editableUsersButtonIcon: SCPalette.gray900,
    editableUsersText: SCPalette.gray900,

    // Settings

    settingsSectionTitle: SCPalette.gray900,
    settingsSectionItemIcon: SCPalette.gray500,
    settingsSectionItemTitle: SCPalette.gray500,

    // Selectable List

    selectableListItemIconSelected: SCPalette.gray900,
    selectableListItemIconUnselected: SCPalette.gray500,
    selectableListItemTitleSelected: SCPalette.gray900,
    selectableListItemTitleUnselected: SCPalette.gray500,
    selectableListItemIndicatorSelected: SCPalette.blue500,
    selectableListItemIndicatorUnselected: SCPalette.gray500,
    selectableLangListItemTitleSelected: SCPalette.gray900,
    selectableLangListItemTitleUnselected: SCPalette.gray500,
    selectableLangListItemIndicatorSelected: SCPalette.blue500,
    selectableLangListItemIndicatorUnselected: SCPalette.gray500
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
    textInputFieldBackground: Color(0xFF333333),
    textInputBoxBackground: Color(0xFF333333),
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
    dialogTextForeground: Color(0xFF999999),
    sheetBackground: Color(0xFF191919),
    sheetTitleForeground: Color(0xFFFBFBFB),
    sheetCancelButtonBackground: Color(0xFF4C4C4C),
    sheetCancelButtonForeground: Color(0xFFFBFBFB),
    switchActiveBackground: Color(0xFF3182CE),
    switchInactiveBackground: Color(0xFF333333),
    switchActiveForeground: Color(0xFFFFFFFF),
    switchInactiveForeground: Color(0xFF999999),
    profileErrorForeground: Color(0xFFFBFBFB),
    userText: Color(0xFFFBFBFB),
    emptyBadges: Color(0xFFFBFBFB),
    editUserIsPrivate: Color(0xFFFBFBFB),
    userFriendshipsUserName: Color(0xFFFBFBFB),
    userFriendshipsSince: Color(0xFF999999),
    userFriendshipsEmptyBadges: Color(0xFFFBFBFB),
    eventListIcon: Color(0xFF999999),
    eventListTitle: Color(0xFFFBFBFB),
    eventListDistance: Color(0xFF999999),
    eventListLocation: Color(0xFF999999),
    eventListTime: Color(0xFF999999),
    imageStackExtraCount: Color(0xFFFBFBFB),
    eventNoGuests: Color(0xFFFFFFFF),
    eventNoGuestsBackground: Color(0xFFDD6B20),
    notificationsText: Color(0xFFFBFBFB),
    notificationText: Color(0xFFFBFBFB),
    notificationTime: Color(0xFF999999),
    notificationsFriendRequestNotFound: Color(0xFFFBFBFB),
    notificationsFriendRequestUserName: Color(0xFFFBFBFB),
    notificationsFriendRequestText: Color(0xFFFBFBFB),
    notificationsFriendRequestAlreadyAnswered: Color(0xFFFBFBFB),
    discoverFiltersTitle: Color(0xFFFBFBFB),
    inactiveTrackColor: Color(0xFF999999),
    activeTrackColor: Color(0xFF3182CE),
    thumbColor: Color(0xFF3182CE),
    discoverFiltersDistance: Color(0xFFFBFBFB),

    // Center Text

    centerText: SCPalette.gray100,

    // Sheet

    sheetSubTitle: SCPalette.gray100,

    // App Bar

    appBarSearchBarBackground: SCPalette.gray700,
    appBarSearchBarDeleteIcon: SCPalette.gray100,
    appBarSearchBarSearchIcon: SCPalette.gray100,
    appBarSearchBarCursor: SCPalette.gray400,
    appBarSearchBarHint: SCPalette.gray400,
    appBarSearchBarText: SCPalette.gray100,

    // Circular Selector

    circularSelectorBackground: Color(0xFF333333),
    circularSelectorSelectedBorder: Color(0xFF3182CE),

    // CTA

    ctaBackground: Color(0xFF3182CE),
    ctaText: Color(0xFFFFFFFF),
    ctaButtonBackground: Color(0xFFFFFFFF),
    ctaButtonText: Color(0xFF191919),

    // Popup

    popupButtonBackground: SCPalette.gray700,
    popupButtonIcon: SCPalette.gray100,
    popupButtonText: SCPalette.gray100,

    // Location

    locationListItemText: SCPalette.gray100,

    // Editable Users

    editableUsersButtonBackground: SCPalette.gray700,
    editableUsersButtonIcon: SCPalette.gray100,
    editableUsersText: SCPalette.gray100,

    // Settings

    settingsSectionTitle: SCPalette.gray100,
    settingsSectionItemIcon: SCPalette.gray400,
    settingsSectionItemTitle: SCPalette.gray400,

    // Selectable List

    selectableListItemIconSelected: SCPalette.gray100,
    selectableListItemIconUnselected: SCPalette.gray400,
    selectableListItemTitleSelected: SCPalette.gray100,
    selectableListItemTitleUnselected: SCPalette.gray400,
    selectableListItemIndicatorSelected: SCPalette.blue600,
    selectableListItemIndicatorUnselected: SCPalette.gray400,
    selectableLangListItemTitleSelected: SCPalette.gray100,
    selectableLangListItemTitleUnselected: SCPalette.gray400,
    selectableLangListItemIndicatorSelected: SCPalette.blue600,
    selectableLangListItemIndicatorUnselected: SCPalette.gray400
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
  final Color textInputFieldBackground;
  final Color textInputBoxBackground;
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
  final Color sheetBackground;
  final Color sheetTitleForeground;
  final Color sheetCancelButtonBackground;
  final Color sheetCancelButtonForeground;
  final Color switchActiveBackground;
  final Color switchInactiveBackground;
  final Color switchActiveForeground;
  final Color switchInactiveForeground;
  final Color profileErrorForeground;
  final Color userText;
  final Color emptyBadges;
  final Color editUserIsPrivate;
  final Color userFriendshipsUserName;
  final Color userFriendshipsSince;
  final Color userFriendshipsEmptyBadges;
  final Color eventListIcon;
  final Color eventListTitle;
  final Color eventListDistance;
  final Color eventListLocation;
  final Color eventListTime;
  final Color imageStackExtraCount;
  final Color eventNoGuests;
  final Color notificationsText;
  final Color notificationText;
  final Color notificationTime;
  final Color notificationsFriendRequestNotFound;
  final Color notificationsFriendRequestAlreadyAnswered;
  final Color notificationsFriendRequestUserName;
  final Color notificationsFriendRequestText;
  final Color discoverFiltersTitle;
  final Color inactiveTrackColor;
  final Color activeTrackColor;
  final Color thumbColor;
  final Color discoverFiltersDistance;
  final Color eventNoGuestsBackground;

  // Center Text

  final Color centerText;

  // Sheet

  final Color sheetSubTitle;

  // App Bar

  final Color appBarSearchBarBackground;
  final Color appBarSearchBarDeleteIcon;
  final Color appBarSearchBarSearchIcon;
  final Color appBarSearchBarCursor;
  final Color appBarSearchBarHint;
  final Color appBarSearchBarText;

  // Circular Selector

  final Color circularSelectorBackground;
  final Color circularSelectorSelectedBorder;

  // CTA

  final Color ctaBackground;
  final Color ctaText;
  final Color ctaButtonBackground;
  final Color ctaButtonText;

  // Popup

  final Color popupButtonBackground;
  final Color popupButtonIcon;
  final Color popupButtonText;

  // Location

  final Color locationListItemText;

  // Editable Users

  final Color editableUsersButtonBackground;
  final Color editableUsersButtonIcon;
  final Color editableUsersText;

  // Settings

  final Color settingsSectionTitle;
  final Color settingsSectionItemIcon;
  final Color settingsSectionItemTitle;

  // Selectable List

  final Color selectableListItemIconSelected;
  final Color selectableListItemIconUnselected;
  final Color selectableListItemTitleSelected;
  final Color selectableListItemTitleUnselected;
  final Color selectableListItemIndicatorSelected;
  final Color selectableListItemIndicatorUnselected;
  final Color selectableLangListItemTitleSelected;
  final Color selectableLangListItemTitleUnselected;
  final Color selectableLangListItemIndicatorSelected;
  final Color selectableLangListItemIndicatorUnselected;
}