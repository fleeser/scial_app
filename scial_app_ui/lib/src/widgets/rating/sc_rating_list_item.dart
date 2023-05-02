import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';
import 'package:scial_app_ui/src/widgets/base/sc_image.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';
import 'package:scial_app_ui/src/widgets/text/sc_text.dart';

class SCRatingListItemImage {

  const SCRatingListItemImage({
    this.url,
    this.file
  });

  const SCRatingListItemImage.url({
    this.url
  })
  : file = null;

  const SCRatingListItemImage.file({
    this.file
  })
  : url = null;

  final String? url;
  final File? file;
}

class SCRatingListItemIndicator {

  const SCRatingListItemIndicator({
    required this.title,
    required this.backgroundColor
  });

  final String title;
  final Color backgroundColor;
}

class SCRatingListItem {

  const SCRatingListItem({
    required this.image,
    required this.name,
    required this.time,
    this.text,
    required this.rating,
    this.indicator
  });

  final SCRatingListItemImage image;
  final String name;
  final String time;
  final String? text;
  final int rating;
  final SCRatingListItemIndicator? indicator;
}

class SCRatingListItemWidget extends StatelessWidget {

  const SCRatingListItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.time,
    this.text,
    required this.ratingTitle,
    required this.rating,
    this.indicator
  });

  final SCRatingListItemImage image;
  final String name;
  final String time;
  final String? text;
  final String ratingTitle;
  final int rating;
  final SCRatingListItemIndicator? indicator;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SCImage(
              url: image.url,
              file: image.file,
              icon: SCIcons.user,
              size: const Size(40.0, 40.0),
              borderRadius: 40.0 / 2.0
            ),
            const SCGap.regular(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SCText.ratingName(name),
                  const SCGap.small(),
                  SCText.ratingTime(time)
                ]
              )
            ),
            if (indicator != null) Container(
              height: 30.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: indicator!.backgroundColor,
              ),
              padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.regular).toEdgeInsets(theme),
              child: SCText.ratingIndicator(indicator!.title)
            )
          ]
        ),
        const SCGap.regular(),
        Row(
          children: [
            Flexible(child: SCText.ratingRatingTitle('$ratingTitle:')),
            const SCGap.semiSmall(),
            ...List.generate(rating, (int index) => Text(
              index == rating - 1 ? '🎉' : '🎉 ',
              style: const TextStyle(fontSize: 18.0)
            ))
          ]
        ),
        if (text != null) SCPadding(
          padding: const SCEdgeInsets.only(top: SCGapSize.regular),
          child: SCText.ratingText(text!)
        )
      ]
    );
  }
}