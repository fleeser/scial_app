import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/widgets/rating/sc_rating_list_item.dart';
import 'package:scial_app_ui/src/widgets/rating/sc_rating_loading.dart';
import 'package:scial_app_ui/src/widgets/rating/sc_rating_text.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCRatingList extends StatelessWidget {

  const SCRatingList({
    super.key,
    this.shouldAddBottomPadding = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorText,
    this.emptyText,
    required this.ratingTitle,
    this.ratings
  });

  final bool shouldAddBottomPadding;
  final bool isLoading;
  final bool hasError;
  final String? errorText;
  final String? emptyText;
  final String ratingTitle;
  final List<SCRatingListItem>? ratings;

  @override
  Widget build(BuildContext context) {
    
    if (hasError) {
      return SCRatingText(
        shouldAddBottomPadding: shouldAddBottomPadding, 
        text: errorText!
      );
    }

    if (isLoading) {
      return SCRatingLoading(shouldAddBottomPadding: shouldAddBottomPadding);
    }

    if (ratings!.isEmpty) {
      SCRatingText(
        shouldAddBottomPadding: shouldAddBottomPadding, 
        text: emptyText!
      );
    }

    return ListView.builder(
      // TODO: KeyPageStore
      itemCount: ratings!.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: shouldAddBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) => SCPadding(
        padding: const SCEdgeInsets.symmetric(
          horizontal: SCGapSize.semiBig,
          vertical: SCGapSize.regular
        ),
        child: SCRatingListItemWidget(
          image: ratings![index].image,
          name: ratings![index].name,
          time: ratings![index].time,
          text: ratings![index].text,
          ratingTitle: ratingTitle,
          rating: ratings![index].rating,
          indicator: ratings![index].indicator
        )
      )
    );
  }
}