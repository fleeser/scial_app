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
    required this.textInputBoxText,
    required this.textInputBoxHint,
    required this.pinInput,
    required this.ratingName,
    required this.ratingTime,
    required this.ratingText,
    required this.ratingRatingTitle,
    required this.ratingIndicator,
    required this.dialogTitle,
    required this.dialogText,
    required this.dialogButton,
    required this.sheetTitle,
    required this.userText,
    required this.emptyBadges,
    required this.editUserIsPrivate,
    required this.userFriendshipsUserName,
    required this.userFriendshipsSince,
    required this.userFriendshipsEmptyBadges,
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
    required this.notificationsFriendRequestUserName,
    required this.notificationsFriendRequestText,
    required this.notificationsFriendRequestAlreadyAnswered,
    required this.discoverFiltersTitle,
    required this.discoverFiltersDistance,

    // Center Text

    required this.centerText,

    // Sheet

    required this.sheetSubTitle,

    // App Bar

    required this.appBarSearchBarHint,
    required this.appBarSearchBarText,

    // CTA

    required this.ctaText,
    required this.ctaButtonText,

    // Popup

    required this.popupButtonText,

    // Location

    required this.locationListItemText,

    // Editable Users

    required this.editableUsersText,

    // Settings

    required this.settingsUniqueCodeTitle,
    required this.settingsUniqueCodeText,
    required this.settingsSectionTitle,
    required this.settingsSectionItemTitle,

    // Selectable List

    required this.selectableListItemTitleSelected,
    required this.selectableListItemTitleUnselected,
    required this.selectableLangListItemTitleSelected,
    required this.selectableLangListItemTitleUnselected,

    // Update User

    required this.updateUserIsPrivate
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
    textInputBoxText: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      decoration: TextDecoration.none,
      package: 'scial_app_ui'
    ),
    textInputBoxHint: TextStyle(
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
    ),
    sheetTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    userText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    emptyBadges: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    editUserIsPrivate: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    userFriendshipsUserName: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    userFriendshipsSince: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    userFriendshipsEmptyBadges: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    eventListTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    eventListDistance: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    eventListLocation: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    eventListTime: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    imageStackExtraCount: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    eventNoGuests: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    notificationsText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    notificationText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    notificationTime: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    notificationsFriendRequestNotFound: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    notificationsFriendRequestUserName: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    notificationsFriendRequestText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    notificationsFriendRequestAlreadyAnswered: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    discoverFiltersTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    discoverFiltersDistance: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),

    // Center Text

    centerText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),

    // Sheet

    sheetSubTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),

    // App Bar

    appBarSearchBarHint: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    appBarSearchBarText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),

    // CTA

    ctaText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    ctaButtonText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),

    // Popup

    popupButtonText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),

    // Location

    locationListItemText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),

    // Editable Users

    editableUsersText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),

    // Settings

    settingsUniqueCodeTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    settingsUniqueCodeText: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    settingsSectionTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    settingsSectionItemTitle: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),

    // Selectable List

    selectableListItemTitleSelected: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    selectableListItemTitleUnselected: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),
    selectableLangListItemTitleSelected: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    ),
    selectableLangListItemTitleUnselected: TextStyle(
      fontFamily: 'Poppins',
      package: 'scial_app_ui',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none
    ),

    // Update User

    updateUserIsPrivate: TextStyle(
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
  final TextStyle textInputBoxText;
  final TextStyle textInputBoxHint;
  final TextStyle pinInput;
  final TextStyle ratingName;
  final TextStyle ratingTime;
  final TextStyle ratingText;
  final TextStyle ratingRatingTitle;
  final TextStyle ratingIndicator;
  final TextStyle dialogTitle;
  final TextStyle dialogText;
  final TextStyle dialogButton;
  final TextStyle sheetTitle;
  final TextStyle userText;
  final TextStyle emptyBadges;
  final TextStyle editUserIsPrivate;
  final TextStyle userFriendshipsUserName;
  final TextStyle userFriendshipsSince;
  final TextStyle userFriendshipsEmptyBadges;
  final TextStyle eventListTitle;
  final TextStyle eventListDistance;
  final TextStyle eventListLocation;
  final TextStyle eventListTime;
  final TextStyle imageStackExtraCount;
  final TextStyle eventNoGuests;
  final TextStyle notificationsText;
  final TextStyle notificationText;
  final TextStyle notificationTime;
  final TextStyle notificationsFriendRequestNotFound;
  final TextStyle notificationsFriendRequestUserName;
  final TextStyle notificationsFriendRequestText;
  final TextStyle notificationsFriendRequestAlreadyAnswered;
  final TextStyle discoverFiltersTitle;
  final TextStyle discoverFiltersDistance;

  // Center Text

  final TextStyle centerText;

  // Sheet

  final TextStyle sheetSubTitle;

  // App Bar

  final TextStyle appBarSearchBarHint;
  final TextStyle appBarSearchBarText;

  // CTA

  final TextStyle ctaText;
  final TextStyle ctaButtonText;

  // Popup

  final TextStyle popupButtonText;

  // Location

  final TextStyle locationListItemText;

  // Editable Users

  final TextStyle editableUsersText;

  // Settings

  final TextStyle settingsUniqueCodeTitle;
  final TextStyle settingsUniqueCodeText;
  final TextStyle settingsSectionTitle;
  final TextStyle settingsSectionItemTitle;

  // Selectable List

  final TextStyle selectableListItemTitleSelected;
  final TextStyle selectableListItemTitleUnselected;
  final TextStyle selectableLangListItemTitleSelected;
  final TextStyle selectableLangListItemTitleUnselected;

  // Update User

  final TextStyle updateUserIsPrivate;
}