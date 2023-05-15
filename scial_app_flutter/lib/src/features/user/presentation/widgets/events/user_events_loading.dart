import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class UserEventsLoading extends StatelessWidget {

  const UserEventsLoading({
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
        // TODO: Page key
        itemCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.only(
          bottom: addBottomPadding 
            ? MediaQuery.of(context).padding.bottom 
            : 0.0
          ),
        itemBuilder: (BuildContext context, int index) => SCPadding(
          padding: const SCEdgeInsets.symmetric(
            vertical: SCGapSize.regular,
            horizontal: SCGapSize.semiBig
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 56.0 + 0.5 * 32.0,
                    height: 56.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SCShimmerLoadingBox(
                            size: Size(56.0, 56.0),
                            borderRadius: 56.0 / 2.0
                          )
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SCShimmerLoadingBox(
                            size: Size(32.0, 32.0),
                            borderRadius: 32.0 / 2.0
                          )
                        )
                      ]
                    )
                  ),
                  const SCGap.regular(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SCShimmerLoadingBox(
                              size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - (32.0 * 0.5) - SCGapSize.regular.getSpacing(theme) - 50.0) * 0.8, 16.0),
                              borderRadius: 8.0
                            ),
                            const SCShimmerLoadingBox(
                              size: Size(50.0, 12.0),
                              borderRadius: 6.0
                            )
                          ]
                        ),
                        const SCGap.semiSmall(),
                        SCShimmerLoadingBox(
                          size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - (32.0 * 0.5) - SCGapSize.regular.getSpacing(theme)) * 0.6, 12.0),
                          borderRadius: 6.0
                        ),
                        const SCGap.small(),
                        SCShimmerLoadingBox(
                          size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - (32.0 * 0.5) - SCGapSize.regular.getSpacing(theme)) * 0.5, 12.0),
                          borderRadius: 6.0
                        )
                      ]
                    )
                  )
                ]
              ),
              const SCGap.regular(),
              Row(
                children: [
                  SizedBox(
                    height: 32.0,
                    width: 32.0 + (5 - 1) * (32.0 * 0.5),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: List.generate(5, (int index) => Padding(
                        padding: EdgeInsets.only(right: index * (32.0 * 0.5)),
                        child: const SCShimmerLoadingBox(
                          size: Size(32.0, 32.0),
                          borderRadius: 32.0 / 2.0
                        )
                      ))
                    )
                  ),
                  const Spacer(),
                  const SCShimmerLoadingBox(
                    size: Size(18.0 , 18.0),
                    borderRadius: 18.0 / 2.0
                  ),
                  const SCGap.semiSmall(),
                  const SCShimmerLoadingBox(
                    size: Size(18.0 , 18.0),
                    borderRadius: 18.0 / 2.0
                  )
                ]
              )
            ]
          )
        )
      )
    );
  }
}