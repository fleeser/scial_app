import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCLightButton extends StatelessWidget {

  const SCLightButton({
    super.key,
    this.onPressed,
    this.isEnabled = true,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
    required this.title
  });

  final void Function()? onPressed;
  final bool isEnabled;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: SCText.lightButtonTitle(
        title,
        overflow: overflow,
        maxLines: maxLines,
        color: color,
        textAlign: textAlign
      )
    );
  }
}