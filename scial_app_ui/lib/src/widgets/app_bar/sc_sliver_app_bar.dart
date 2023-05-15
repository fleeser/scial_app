import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_sliver_app_bar_back_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_sliver_app_bar_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_sliver_app_bar_image.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_sliver_app_bar_title.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCSliverAppBar extends StatelessWidget {

  const SCSliverAppBar({
    super.key,
    required this.context,
    this.backButton,
    this.image,
    this.actionButtons = const [],
    this.title
  });

  final BuildContext context;
  final SCSliverAppBarBackButton? backButton;
  final SCSliverAppBarImage? image;
  final List<SCSliverAppBarButton> actionButtons;
  final SCSliverAppBarTitle? title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SCSliverAppBarDelegate(
        context: context,
        backButton: backButton,
        actionButtons: actionButtons,
        image: image,
        title: title
      )
    );
  }
}

class SCSliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  const SCSliverAppBarDelegate({
    required this.context,
    this.backButton,
    this.actionButtons = const [],
    this.image,
    this.title
  });

  final BuildContext context;
  final SCSliverAppBarBackButton? backButton;
  final List<SCSliverAppBarButton> actionButtons;
  final SCSliverAppBarImage? image;
  final SCSliverAppBarTitle? title;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    final SCThemeData theme = SCTheme.of(context);

    final double progress = min(shrinkOffset, maxExtent - minExtent) / (maxExtent - minExtent);

    return Container(
      color: Color.lerp(theme.colors.sliverAppBarExpandedBackground, theme.colors.sliverAppBarCollapsedBackground, progress),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (image != null) SCSliverAppBarImageBackgroundWidget(
            progress: progress,
            file: image!.file,
            url: image!.url,
            icon: image!.icon,
            loading: image!.loading,
            error: image!.error
          ),
          if (backButton != null) Positioned(
            top: MediaQuery.of(context).padding.top + 5.0,
            left: SCGapSize.semiBig.getSpacing(theme),
            width: kToolbarHeight - 10.0,
            height: kToolbarHeight - 10.0,
            child: backButton!
          ),
          if (actionButtons.isNotEmpty) Positioned(
            top: MediaQuery.of(context).padding.top + 5.0,
            right: SCGapSize.semiBig.getSpacing(theme),
            width: actionButtons.length * (kToolbarHeight - 10.0) + (
              actionButtons.length > 1 
                ? (actionButtons.length - 1.0) * SCGapSize.regular.getSpacing(theme) 
                : 0.0
              ),
            height: kToolbarHeight - 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(actionButtons.length, (int index) => SCPadding(
                padding: SCEdgeInsets.only(
                  left: index == 0
                    ? SCGapSize.none
                    : SCGapSize.regular
                ),
                child: actionButtons[index]
              ))
            )
          ),
          if (image != null && progress == 1.0) Positioned(
            top: MediaQuery.of(context).padding.top + 5.0,
            left: SCGapSize.semiBig.getSpacing(theme) + (backButton != null ? (kToolbarHeight - 10.0) + SCGapSize.semiBig.getSpacing(theme) : 0.0),
            height: kToolbarHeight - 10.0,
            width: kToolbarHeight - 10.0,
            child: SCSliverAppBarImageWidget(
              file: image!.file,
              url: image!.url,
              icon: image!.icon,
              loading: image!.loading,
              error: image!.error
            )
          ),
          if (title != null && !title!.error && (progress == 1.0 || !title!.loading)) Positioned(
            left: lerpDouble(SCGapSize.semiBig.getSpacing(theme), SCGapSize.semiBig.getSpacing(theme) + (backButton != null ? (kToolbarHeight - 10.0) + SCGapSize.semiBig.getSpacing(theme) : 0.0) + (image != null ? (kToolbarHeight - 10.0) + SCGapSize.regular.getSpacing(theme) : 0.0), progress),
            bottom: lerpDouble(SCGapSize.semiBig.getSpacing(theme), (kToolbarHeight - theme.typography.sliverAppBarCollapsedTitle.fontSize!) / 2.0, progress),
            height: lerpDouble(theme.typography.sliverAppBarExpandedTitle.fontSize, theme.typography.sliverAppBarCollapsedTitle.fontSize, progress),
            width: lerpDouble(MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme), MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - (backButton != null ? (kToolbarHeight - 10.0) + SCGapSize.semiBig.getSpacing(theme) : 0.0) - (image != null ? (kToolbarHeight - 10.0) + SCGapSize.regular.getSpacing(theme) : 0.0) - (actionButtons.isNotEmpty ? actionButtons.length * (kToolbarHeight - 10.0) + (actionButtons.length - 1) * SCGapSize.regular.getSpacing(theme) + SCGapSize.semiBig.getSpacing(theme) : 0.0), progress),
            child: SCSliverAppBarTitleWidget(
              progress: progress,
              title: title!.title,
              loading: title!.loading,
              error: title!.error
            )
          )
        ]
      )
    );
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();

  @override
  double get maxExtent => MediaQuery.of(context).size.height / 2.0;

  @override
  double get minExtent => MediaQuery.of(context).padding.top + kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}