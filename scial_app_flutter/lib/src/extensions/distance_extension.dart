import 'package:flutter/material.dart';

extension DistanceExtension on double {

  String toText(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    bool isEnglishUS = <Locale>[ const Locale('en'), const Locale('en', 'US') ].contains(locale);

    if (isEnglishUS) {
      double yards = this * 1.09361;
      return yards >= 1760.0 ? '${(this / 1760.0).toStringAsFixed(1)} mi' : '${yards.toStringAsFixed(1)} yd';
    }

    return this >= 1000.0 ? '${(this / 1000.0).toStringAsFixed(1)} km' : '${toStringAsFixed(1)} m';
  }
}