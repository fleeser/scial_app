import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_back_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_image.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_title.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCAppBar extends StatelessWidget implements PreferredSizeWidget {

  const SCAppBar({
    super.key,
    required this.context,
    this.title,
    this.image,
    this.backButton,
    this.actionButtons = const <SCAppBarButton>[]
  });

  final BuildContext context;
  final SCAppBarTitle? title;
  final SCAppBarImage? image;
  final SCAppBarBackButton? backButton;
  final List<SCAppBarButton> actionButtons;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Container(
      width: preferredSize.width,
      height: preferredSize.height,
      color: theme.colors.appBarBackground,
      padding: EdgeInsets.only(
        left: SCGapSize.semiBig.getSpacing(theme),
        right: SCGapSize.semiBig.getSpacing(theme),
        top: MediaQuery.of(context).padding.top
      ),
      child: Row(
        children: [
          if (backButton != null) SCPadding(
            padding: const SCEdgeInsets.only(right: SCGapSize.semiBig),
            child: backButton
          ),
          Expanded(
            child: Row(
              children: [
                if (image != null) image!,
                if (image != null && title != null) const SCGap.regular(),
                if (title != null) Expanded(child: title!)
              ]
            )
          ),
          ...List.generate(actionButtons.length, (int index) => SCPadding(
            padding: SCEdgeInsets.only(
              left: index == 0
                ? SCGapSize.semiBig
                : SCGapSize.regular
            ),
            child: actionButtons[index]
          ))
        ]
      )
    );
  }
  
  @override
  Size get preferredSize => Size(double.maxFinite, MediaQuery.of(context).padding.top + kToolbarHeight);
}