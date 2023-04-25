import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_title_image.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_title_text.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';

class SCAppBarTitle extends StatelessWidget {

  const SCAppBarTitle({
    super.key,
    this.title,
    this.image
  });

  final SCAppBarTitleText? title;
  final SCAppBarTitleImage? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (image != null) image!,
        if (image != null && title != null) const SCGap.regular(),
        if (title != null) Expanded(child: title!)
      ]
    );
  }
}