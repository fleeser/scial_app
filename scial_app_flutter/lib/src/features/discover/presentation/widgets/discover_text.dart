import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class DiscoverText extends StatelessWidget {

  const DiscoverText({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SCPadding.semiBig(child: Center(child: SCText.notificationsText(text)));
  }
}