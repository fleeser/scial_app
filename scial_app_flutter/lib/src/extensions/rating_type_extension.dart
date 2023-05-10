import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

extension RatingTypeExtension on RatingType {

  String toText(BuildContext context) {
    switch (this) {
      case RatingType.host: return AppLocalizations.of(context)!.rating_type_host;
      case RatingType.guest: return AppLocalizations.of(context)!.rating_type_guest;
    }
  }

  Color toBackgroundColor(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    switch (this) {
      case RatingType.host: return theme.colors.ratingIndicatorHostBackground;
      case RatingType.guest: return theme.colors.ratingIndicatorGuestBackground;
    }
  }
}