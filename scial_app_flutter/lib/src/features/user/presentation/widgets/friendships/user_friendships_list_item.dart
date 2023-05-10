import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/date_time_extension.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/friendships/user_friendships_list_item_badges.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserFriendshipsListItem extends StatelessWidget {

  const UserFriendshipsListItem({
    super.key,
    required this.friendship
  });

  final PublicUserFriendship friendship;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SCGap.semiBig(),
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: Row(
            children: [
              SCImage.url(
                url: friendship.user?.imageUrl,
                size: const Size(56.0, 56.0),
                icon: SCIcons.user,
                borderRadius: 28.0
              ),
              const SCGap.semiBig(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SCText.userFriendshipsUserName(friendship.user?.name ?? AppLocalizations.of(context)!.user_name),
                    const SCGap.semiSmall(),
                    SCText.userFriendshipsSince('${ AppLocalizations.of(context)!.user_friendships_friendship_since }: ${ friendship.created.toStaticDateText(context) }')
                  ]
                )
              )
            ]
          )
        ),
        friendship.badges.isNotEmpty
          ? SizedBox(
            height: 2.0 * SCGapSize.regular.getSpacing(theme) + 30.0,
            child: UserFriendshipsListItemBadges(badges: friendship.badges),
          )
          : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SCGapSize.semiBig.getSpacing(theme),
              vertical: (2.0 * SCGapSize.regular.getSpacing(theme) + 30.0 - theme.typography.userFriendshipsEmptyBadges.fontSize!) / 2.0
            ),
            child: SCText.userFriendshipsEmptyBadges(AppLocalizations.of(context)!.user_friendships_empty_badges_text)
          ),
        SizedBox(height: SCGapSize.semiBig.getSpacing(theme) - SCGapSize.regular.getSpacing(theme))
      ]
    );
  }
}