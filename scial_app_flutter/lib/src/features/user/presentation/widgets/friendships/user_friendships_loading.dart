import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class UserFriendshipsLoading extends StatelessWidget {

  const UserFriendshipsLoading({
    super.key,
    required this.addBottomPadding
  });

  final bool addBottomPadding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // TODO: Page key
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: addBottomPadding ? MediaQuery.of(context).padding.bottom : 0.0),
      itemBuilder: (BuildContext context, int index) => const UserFriendshipsLoadingItem()
    );
  }
}

class UserFriendshipsLoadingItem extends StatelessWidget {

  const UserFriendshipsLoadingItem({ super.key });

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SCShimmerLoading(
      isLoading: true,
      child: SCPadding(
        padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SCShimmerLoadingBox(
                  size: Size(56.0, 56.0),
                  borderRadius: 56.0 / 2.0
                ),
                const SCGap.semiBig(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SCShimmerLoadingBox(
                        size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - SCGapSize.semiBig.getSpacing(theme)) * 0.7, 16.0),
                        borderRadius: 16.0 / 2
                      ),
                      const SCGap.semiSmall(),
                      SCShimmerLoadingBox(
                        size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme) - 56.0 - SCGapSize.semiBig.getSpacing(theme)) * 0.5, 12.0),
                        borderRadius: 12.0 / 2
                      )
                    ]
                  )
                )
              ]
            ),
            const SCGap.regular(),
            SCShimmerLoadingBox( // TODO: Draw loading badge form
              size: Size((MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme)) * 0.5, 30.0),
              borderRadius: 30.0 / 2
            ),
            const SCGap.semiBig()
          ]
        )
      )
    );
  }
}