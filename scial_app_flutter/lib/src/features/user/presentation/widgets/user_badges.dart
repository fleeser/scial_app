import 'package:flutter/material.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/user_badge_extension.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserBadges extends StatelessWidget {

  const UserBadges({
    super.key,
    this.badges,
    this.loading = false,
    this.error = false
  });

  final List<UserBadge>? badges;
  final bool loading;
  final bool error;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return Container(
      height: SCGapSize.regular.getSpacing(theme) + 40.0,
      width: double.infinity,
      color: theme.colors.background,
      child: SCShimmerLoading(
        isLoading: loading,
        child: loading
          ? BadgesList(items: List.generate(3, (int index) => const SCShimmerLoadingBox(
            size: Size(40.0, 40.0),
            borderRadius: 40.0 / 2.0,
          ))) // TODO implement shape of loading badge
          : !error
            ? badges!.isNotEmpty
              ? BadgesList(items: List.generate(badges!.length, (int index) => SvgPicture.asset(
                badges![index].path,
                width: 40.0,
                height: 40.0
              )))
              : Padding(
                padding: EdgeInsets.only(
                  top: SCGapSize.regular.getSpacing(theme) + (40.0 - theme.typography.paragraph1.fontSize!) / 2.0,
                  left: SCGapSize.semiBig.getSpacing(theme),
                  right: SCGapSize.semiBig.getSpacing(theme)
                ),
                child: SCText.paragraph1(
                  AppLocalizations.of(context)!.user_badges_empty,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  height: 1.0
                )
              )
            : const SizedBox()
      )
    );
  }
}

class BadgesList extends StatelessWidget {

  const BadgesList({
    super.key,
    required this.items
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {

    final SCThemeData theme = SCTheme.of(context);

    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      padding: const SCEdgeInsets.only(top: SCGapSize.regular).toEdgeInsets(theme),
      itemBuilder: (BuildContext context, int index) => SCPadding(
        padding: SCEdgeInsets.only(
          left: index == 0
            ? SCGapSize.semiBig
            : SCGapSize.semiSmall,
          right: index == items.length - 1
            ? SCGapSize.semiBig
            : SCGapSize.semiSmall
        ),
        child: items[index]
      )
    );
  }
}