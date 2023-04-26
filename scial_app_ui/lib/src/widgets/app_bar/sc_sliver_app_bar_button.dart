import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_circular_progress_indicator.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';

class SCSliverAppBarButton extends StatelessWidget {

  const SCSliverAppBarButton({
    super.key,
    this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.icon
  });

  final void Function()? onPressed;
  final bool loading;
  final bool enabled;
  final SCIcons? icon;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      width: kToolbarHeight - 10.0,
      height: kToolbarHeight - 10.0,
      child: RawMaterialButton(
        onPressed: !loading && enabled ? onPressed : null,
        elevation: 0.0,
        enableFeedback: !loading && enabled,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((kToolbarHeight - 10.0) / 2.0)),
        fillColor: theme.colors.appBarButtonBackground,
        child: loading
          ? SCCircularProgressIndicator(
            color: theme.colors.appBarButtonForeground, 
            size: (kToolbarHeight - 10.0) / 2.0
          )
          : icon != null
            ? SCIcon(
              icon: icon!, 
              size: (kToolbarHeight - 10.0) / 2.0, 
              color: theme.colors.appBarButtonForeground
            )
            : null
      )
    );
  }
}