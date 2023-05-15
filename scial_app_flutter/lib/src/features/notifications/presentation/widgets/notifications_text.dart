import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class NotificationsText extends StatelessWidget {

  const NotificationsText({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SCPadding.semiBig(child: Center(child: SCText.notificationsText(text)));
  }
}