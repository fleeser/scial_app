import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCImageStack extends StatelessWidget {

  const SCImageStack({
    super.key,
    this.displayCount = 5,
    required this.count,
    this.urls = const <String?>[],
    required this.icon,
    required this.size,
    this.overlapPercentage = 0.5
  });

  final int displayCount;
  final int count;
  final List<String?> urls;
  final SCIcons icon;
  final Size size;
  final double overlapPercentage;

  @override
  Widget build(BuildContext context) {

    int imagesToDisplay = count > displayCount ? displayCount : count;

    return Row(
      children: [
        SizedBox(
          height: size.height,
          width: size.width + (imagesToDisplay - 1) * (size.width * overlapPercentage),
          child: Stack(
            alignment: Alignment.centerRight,
            children: List.generate(imagesToDisplay, (int index) => Padding(
              padding: EdgeInsets.only(right: index * (size.width * overlapPercentage)),
              child: SCImage.url(
                url: urls[index],
                size: size,
                borderRadius: size.height / 2.0,
                icon: icon
              )
            ))
          )
        ),
        if (count > displayCount) const SCGap.semiSmall(),
        if (count > displayCount) Flexible(child: SCText.imageStackExtraCount('+ ${count - imagesToDisplay}'))
      ]
    );
  }
}