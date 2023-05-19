import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_back_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_image.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_search_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_title.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCAppBar extends ConsumerWidget implements PreferredSizeWidget {

  const SCAppBar({
    super.key,
    required this.context,
    this.title,
    this.image,
    this.backButton,
    this.actionButtons = const <SCAppBarButton>[],
    this.searchButton
  });

  final BuildContext context;
  final SCAppBarTitle? title;
  final SCAppBarImage? image;
  final SCAppBarBackButton? backButton;
  final List<SCAppBarButton> actionButtons;
  final SCAppBarSearchButton? searchButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final SCThemeData theme = SCTheme.of(context);

    final bool searchIsExpanded = searchButton != null
      ? ref.watch(searchButton!.isExpandedProvider)
      : false;

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
          if (backButton != null) animatedWidget(
            SCPadding(
              padding: const SCEdgeInsets.only(right: SCGapSize.semiBig),
              child: backButton
            ),
            searchIsExpanded),
          Expanded(
            child: animatedWidget(Row(
              children: [
                if (image != null) image!,
                if (image != null && title != null) const SCGap.regular(),
                if (title != null) Expanded(child: title!)
              ]
            ), searchIsExpanded)),
          ...List.generate(actionButtons.length + (searchButton != null ? 1 : 0), (int index) => searchButton != null && index == actionButtons.length
            ? SCPadding(
              padding: SCEdgeInsets.only(
                left: searchIsExpanded ? SCGapSize.none : index == 0
                  ? SCGapSize.semiBig
                  : SCGapSize.regular
              ),
              child: searchButton
            )
            : animatedWidget(SCPadding(
              padding: SCEdgeInsets.only(
                left: index == 0
                  ? SCGapSize.semiBig
                  : SCGapSize.regular
              ),
              child: actionButtons[index]
            ), searchIsExpanded)
          )
        ]
      )
    );
  }
  
  @override
  Size get preferredSize => Size(double.maxFinite, MediaQuery.of(context).padding.top + kToolbarHeight);

  Widget animatedWidget(Widget child, bool isExpanded) => AnimatedSwitcher(
    duration: const Duration(milliseconds: 375),
    reverseDuration: Duration.zero,
    child: !isExpanded ? child : null
  );
}