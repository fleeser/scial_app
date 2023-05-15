import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/ratings/user_ratings_list_item.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class UserRatingsList extends StatelessWidget {

  const UserRatingsList({
    super.key,
    required this.addBottomPadding,
    required this.ratings
  });

  final bool addBottomPadding;
  final List<PublicUserRating> ratings;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return ListView.builder(
      // TODO: KeyPageStore
      itemCount: ratings.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: SCGapSize.semiBig.getSpacing(theme),
        right: SCGapSize.semiBig.getSpacing(theme),
        bottom: addBottomPadding
          ? MediaQuery.of(context).padding.bottom
          : 0.0
      ),
      itemBuilder: (BuildContext context, int index) => UserRatingsListItem(rating: ratings[index])
    );
  }
}