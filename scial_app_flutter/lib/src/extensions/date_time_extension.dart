import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DateTimeExtension on DateTime {

  String toStaticDateText(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    bool isEnglishUS = <Locale>[ const Locale('en'), const Locale('en', 'US') ].contains(locale);

    if (isEnglishUS) {
      return '${_padZeros(month, 2)}/${_padZeros(day, 2)}/$year}';
    }

    return '${_padZeros(day, 2)}.${_padZeros(month, 2)}.$year}';
  }

  String toDynamicDateText(BuildContext context) {
    DateTime check = DateTime(year, month, day);
    DateTime now = DateTime.now();
    DateTime lastWeek = DateTime(now.year, now.month, now.day - 7);
    DateTime comingWeek = DateTime(now.year, now.month, now.day + 7);

    bool today = check == DateTime(now.year, now.month, now.day);
    bool yesterday = check == DateTime(now.year, now.month, now.day - 1);
    bool tomorrow = check == DateTime(now.year, now.month, now.day + 1);
    bool inOneWeek = (check.isAtSameMomentAs(lastWeek) || check.isAfter(lastWeek)) && (check.isAtSameMomentAs(comingWeek) || check.isBefore(comingWeek));

    if (today) {
      return AppLocalizations.of(context)!.date_time_today;
    } else if (yesterday) {
      return AppLocalizations.of(context)!.date_time_yesterday;
    } else if (tomorrow) {
      return AppLocalizations.of(context)!.date_time_tomorrow;
    } else if (inOneWeek) {
      return _weekdayText(context);
    } else {
      return toStaticDateText(context);
    }
  }

  String toTimeText(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    bool isEnglishUS = <Locale>[ const Locale('en'), const Locale('en', 'US') ].contains(locale);

    if (isEnglishUS) {
      return '${hour == 0 ? 12 : _padZeros(hour > 12 ? hour - 12 : hour, 2)}:${_padZeros(minute, 2)} ${hour < 12 ? 'AM' : 'PM'}';
    }

    return '${_padZeros(hour, 2)}:${_padZeros(minute, 2)} Uhr';
  }

  String toStaticFullDateTimeText(BuildContext context) {
    return '${toStaticDateText(context)} ${toTimeText(context)}';
  }

  String toDynamicFullDateTimeText(BuildContext context) {
    return '${toDynamicDateText(context)} ${toTimeText(context)}';
  }

  String _weekdayText(BuildContext context) {
    switch (weekday) {
      case 1: return AppLocalizations.of(context)!.date_time_monday;
      case 2: return AppLocalizations.of(context)!.date_time_tuesday;
      case 3: return AppLocalizations.of(context)!.date_time_wednesday;
      case 4: return AppLocalizations.of(context)!.date_time_thursday;
      case 5: return AppLocalizations.of(context)!.date_time_friday;
      case 6: return AppLocalizations.of(context)!.date_time_saturday;
      default: return AppLocalizations.of(context)!.date_time_sunday;
    }
  }

  String _padZeros(int number, int count) {
    return number.toString().padLeft(count, '0');
  }
}