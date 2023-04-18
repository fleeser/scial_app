import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_icon.dart';
import 'package:scial_app_ui/src/widgets/base/sc_shimmer.dart';

class SCImage extends StatelessWidget {

  const SCImage.url({
    super.key,
    this.size = const Size(double.infinity, double.infinity),
    this.borderRadius = 0.0,
    this.url,
    this.icon,
    this.loading = false,
    this.error = false
  });

  final Size size;
  final double borderRadius;
  final String? url;
  final SCIcons? icon;
  final bool loading;
  final bool error;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return SCShimmerLoading(
      isLoading: loading,
      loadingChild: SCShimmerLoadingBox(
        size: size,
        borderRadius: borderRadius
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: size.width,
          height: size.height,
          color: theme.colors.imageBackground,
          child: error || url == null
            ? _icon(theme.colors.imageIconForeground)
            : url != null
              ? ExtendedImage.network(
                url!,
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
                enableLoadState: false,
                loadStateChanged: (ExtendedImageState state) => loadStateChanged(state, theme.colors.imageIconForeground)
              )
              : null
        )
      )
    );
  }

  Widget? _icon(Color color) {
    return icon != null
      ? SCIcon(
        icon: icon!, 
        size: size.width / 2.0,
        color: color
      ) // TODO: Icon is maxed in size
      : null;
  }

  Widget? loadStateChanged(ExtendedImageState state, Color color) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
      case LoadState.completed:
        return null;
      case LoadState.failed: return _icon(color);
    }
  }
}