import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class UserRatingsLoading extends StatelessWidget {

  const UserRatingsLoading({
    super.key,
    required this.addBottomPadding
  });

  final bool addBottomPadding;

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);
    
    return SCShimmerLoading(
      isLoading: true, 
      child: ListView.builder(
        // TODO: KeyPageStore
        itemCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.only(
          bottom: addBottomPadding
            ? MediaQuery.of(context).padding.bottom
            : 0.0
        ),
        itemBuilder: (BuildContext context, int index) => SCPadding(
          padding: const SCEdgeInsets.symmetric(
            horizontal: SCGapSize.semiBig,
            vertical: SCGapSize.regular
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SCShimmerLoadingBox(
                    size: Size(56.0, 56.0),
                    borderRadius: 56.0 / 2.0
                  ),
                  const SCGap.regular(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SCShimmerLoadingBox(
                          size: Size((MediaQuery.of(context).size.width - 2.0 * theme.spacing.semiBig - 40.0 - theme.spacing.regular) * 0.5, 14.0),
                          borderRadius: 14.0 / 2.0 // TODO: Also size 16
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
        )
      )
    );
  }
}