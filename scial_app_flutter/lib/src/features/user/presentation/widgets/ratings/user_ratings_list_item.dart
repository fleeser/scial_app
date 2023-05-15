import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/date_time_extension.dart';
import 'package:scial_app_flutter/src/extensions/rating_type_extension.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserRatingsListItem extends StatelessWidget {

  const UserRatingsListItem({
    super.key,
    required this.rating
  });

  final PublicUserRating rating;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SCGap.regular(),
        Row(
          children: [
            SCImage.url(
              url: rating.sender?.imageUrl,
              icon: SCIcons.user,
              size: const Size(56.0, 56.0),
              borderRadius: 56.0 / 2.0
            ),
            const SCGap.regular(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SCText.ratingName(rating.sender?.name ?? AppLocalizations.of(context)!.user_name),
                  const SCGap.small(),
                  SCText.ratingTime(rating.created.toDynamicDateText(context))
                ]
              )
            ),
            Container(
              height: 30.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: rating.type.toBackgroundColor(context)
              ),
              padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.regular).toEdgeInsets(theme),
              child: SCText.ratingIndicator(rating.type.toText(context))
            )
          ]
        ),
        const SCGap.regular(),
        Row(
          children: [
            Flexible(child: SCText.ratingRatingTitle(AppLocalizations.of(context)!.user_ratings_rating_title)),
            const SCGap.semiSmall(),
            ...List.generate(rating.stars, (int index) => Text(
              index == rating.stars - 1 ? '🎉' : '🎉 ',
              style: const TextStyle(fontSize: 18.0)
            ))
          ]
        ),
        if (rating.text != null) SCPadding(
          padding: const SCEdgeInsets.only(top: SCGapSize.regular),
          child: SCText.ratingText(rating.text!)
        ),
        const SCGap.regular()
      ]
    );
  }
}