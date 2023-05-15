import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scial_app_flutter/src/extensions/friendship_badge_extension.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_client/scial_app_client.dart';

class UserFriendshipsListItemBadges extends StatelessWidget {

  const UserFriendshipsListItemBadges({
    super.key,
    required this.badges
  });

  final List<FriendshipBadge> badges;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return ListView.builder(
      itemCount: badges.length,
      scrollDirection: Axis.horizontal,
      padding: const SCEdgeInsets.only(top: SCGapSize.regular).toEdgeInsets(theme),
      itemBuilder: (BuildContext context, int index) => SCPadding(
        padding: SCEdgeInsets.only(
          left: index == 0
            ? SCGapSize.semiBig
            : SCGapSize.semiSmall,
          right: index == badges.length - 1
            ? SCGapSize.semiBig
            : SCGapSize.semiSmall
        ),
        child: SvgPicture.asset(
          badges[index].path,
          width: 30.0,
          height: 30.0
        )
      )
    );
  }
}