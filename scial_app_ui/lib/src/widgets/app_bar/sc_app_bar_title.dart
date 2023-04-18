import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_title_image.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_title_text.dart';

class SCAppBarTitle extends StatelessWidget {

  const SCAppBarTitle({
    super.key,
    this.title,
    this.image,
    this.extra
  });

  final SCAppBarTitleText? title;
  final SCAppBarTitleImage? image;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (image != null) image!,
        if (image != null && title != null) const AppGap.regular(),
        if (title != null) Expanded(child: title!)
      ]
    );
  }
}