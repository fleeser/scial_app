import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/base/sc_shimmer.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCRatingListItemLoading extends StatelessWidget {

  const SCRatingListItemLoading({ super.key });

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SCShimmerLoading(
      isLoading: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SCShimmerLoadingBox(
                size: Size(40.0, 40.0),
                borderRadius: 40.0 / 2.0
              ),
              const SCGap.regular(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SCShimmerLoadingBox(
                      size: Size((MediaQuery.of(context).size.width - 2.0 * theme.spacing.semiBig - 40.0 - theme.spacing.regular) * 0.5, 14.0),
                      borderRadius: 14.0 / 2.0
                    ),
                    const SCGap.small(),
                    SCShimmerLoadingBox(
                      size: Size((MediaQuery.of(context).size.width - 2.0 * theme.spacing.semiBig - 40.0 - theme.spacing.regular) * 0.3, 12.0),
                      borderRadius: 12.0 / 2.0
                    )
                  ]
                )
              )
            ]
          ),
          const SCGap.regular(),
          SCShimmerLoadingBox(
            size: Size((MediaQuery.of(context).size.width - 2.0 * theme.spacing.semiBig) * 0.5, 18.0),
            borderRadius: 18.0 / 2.0
          ),
          SCPadding(
            padding: const SCEdgeInsets.only(top: SCGapSize.regular),
            child: Column(
              children: [
                SCShimmerLoadingBox(
                  size: Size(MediaQuery.of(context).size.width - 2.0 * theme.spacing.semiBig, 14.0),
                  borderRadius: 14.0 / 2.0
                ),
                const SCGap.small(),
                SCShimmerLoadingBox(
                  size: Size(MediaQuery.of(context).size.width - 2.0 * theme.spacing.semiBig, 14.0),
                  borderRadius: 14.0 / 2.0
                ),
                const SCGap.small(),
                SCShimmerLoadingBox(
                  size: Size((MediaQuery.of(context).size.width - 2.0 * theme.spacing.semiBig), 14.0),
                  borderRadius: 14.0 / 2.0
                )
              ]
            )
          )
        ]
      )
    );
  }
}