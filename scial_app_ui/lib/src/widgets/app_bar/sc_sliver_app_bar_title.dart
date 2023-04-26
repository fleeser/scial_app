import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_shimmer.dart';

class SCSliverAppBarTitle {

  const SCSliverAppBarTitle({
    this.title,
    this.loading = false,
    this.error = false
  });

  final String? title;
  final bool loading;
  final bool error;
}

class SCSliverAppBarTitleWidget extends StatelessWidget {

  const SCSliverAppBarTitleWidget({
    super.key,
    required this.progress,
    this.title,
    this.loading = false,
    this.error = false
  });

  final double progress;
  final String? title;
  final bool loading;
  final bool error;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);
    
    return SCShimmerLoading( // TODO: What if I want an appbar that I know has no loading and therefore dont wrap with Shimmer()? => Would throw error because cant find shimmer in widget tree
      isLoading: loading, 
      child: loading
        ? SCShimmerLoadingBox(
          size: Size(double.infinity, lerpDouble(theme.typography.sliverAppBarExpandedTitle.fontSize, theme.typography.sliverAppBarCollapsedTitle.fontSize, progress)!),
          borderRadius: lerpDouble(theme.typography.sliverAppBarExpandedTitle.fontSize, theme.typography.sliverAppBarCollapsedTitle.fontSize, progress)! / 2.0
        )
        : error || title == null
          ? const SizedBox.shrink()
          : SCText(
            title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle.lerp(
              theme.typography.sliverAppBarExpandedTitle.copyWith(color: theme.colors.sliverAppBarExpandedTitle), 
              theme.typography.sliverAppBarCollapsedTitle.copyWith(color: theme.colors.sliverAppBarCollapsedTitle), 
              progress
            )
          )
    );
  }
}