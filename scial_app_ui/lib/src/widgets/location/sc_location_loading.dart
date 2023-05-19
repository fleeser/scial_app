import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCLocationLoading extends StatelessWidget {

  const SCLocationLoading({
    super.key,
    this.addBottomPadding = false
  });

  final bool addBottomPadding;

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);

    return SCShimmerLoading(
      isLoading: true, 
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: SCGapSize.semiBig.getSpacing(theme),
          right: SCGapSize.semiBig.getSpacing(theme),
          bottom: addBottomPadding
            ? MediaQuery.of(context).padding.bottom
            : 0.0
        ),
        itemBuilder: (BuildContext context, int index) => SCPadding(
          padding: const SCEdgeInsets.symmetric(vertical: SCGapSize.regular),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 1.5 * 14.0 / 2.0),
              SCShimmerLoadingBox(
                size: Size(MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme), 14.0),
                borderRadius: 7.0
              ),
              const SizedBox(height: 1.5 * 14.0 / 2.0),
              SCShimmerLoadingBox(
                size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme)) * 0.8, 14.0),
                borderRadius: 7.0
              ),
              const SizedBox(height: 1.5 * 14.0 / 2.0),
              SCShimmerLoadingBox(
                size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme)) * 0.4, 14.0),
                borderRadius: 7.0
              ),
              const SizedBox(height: 1.5 * 14.0 / 2.0)
            ]
          )
        )
      )
    );
  }
}