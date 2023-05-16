import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class NotificationsLoading extends StatelessWidget {

  const NotificationsLoading({ super.key });

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SCShimmerLoading(
      isLoading: true, 
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig).toEdgeInsets(theme),
        itemBuilder: (BuildContext context, int index) => SCPadding(
          padding: const SCEdgeInsets.symmetric(vertical: SCGapSize.regular),
          child: Row(
            children: [
              const SCShimmerLoadingBox(
                size: Size(56.0, 56.0),
                borderRadius: 56.0 / 2.0
              ),
              const SCGap.regular(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SCShimmerLoadingBox(
                    size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - 2.0 * SCGapSize.regular.getSpacing(theme) - 60.0) * 0.8, 12.0),
                    borderRadius: 6.0
                  ),
                  const SCGap.small(),
                  SCShimmerLoadingBox(
                    size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - 2.0 * SCGapSize.regular.getSpacing(theme) - 60.0) * 0.6, 12.0),
                    borderRadius: 6.0
                  ),
                  const SCGap.small(),
                  SCShimmerLoadingBox(
                    size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - 2.0 * SCGapSize.regular.getSpacing(theme) - 60.0) * 0.4, 12.0),
                    borderRadius: 6.0
                  ),
                ]
              ),
              const Spacer(),
              const SizedBox(
                height: 56.0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: SCShimmerLoadingBox(
                    size: Size(60.0, 10.0),
                    borderRadius: 5.0
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}