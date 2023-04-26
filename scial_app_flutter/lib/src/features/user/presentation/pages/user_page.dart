import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/presentation/controller/user_controller.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/user_badges.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPage extends StatefulHookConsumerWidget {

  const UserPage({
    super.key,
    required this.id
  });

  final int id;

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {

    final userController = ref.watch(userControllerProvider(widget.id));

    _tabController = useTabController(initialLength: _tabBarTitles.length);

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        body: ExtendedNestedScrollView(
          pinnedHeaderSliverHeightBuilder: () => MediaQuery.of(context).padding.top + kToolbarHeight,
          onlyOneScrollInBody: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SCSliverAppBar(
              context: context,
              backButton: _backButton,
              actionButtons: _actionButtons,
              image: SCSliverAppBarImage.url(
                url: userController.whenOrNull(data: (PublicUser user) => user.imageUrl),
                icon: SCIcons.user,
                loading: userController.isLoading,
                error: userController.hasError
              ),
              title: SCSliverAppBarTitle(
                title: userController.whenOrNull(data: (PublicUser user) => user.name ?? 'scial user'),
                loading: userController.isLoading,
                error: userController.hasError
              )
            )
          ],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserBadges(
                badges: userController.whenOrNull(data: (PublicUser user) => user.badges),
                loading: userController.isLoading,
                error: userController.hasError
              ),
              SCTabBar(
                controller: _tabController, 
                titles: _tabBarTitles
              ),
              Expanded(
                child: Container()
              )
            ]
          )
        )
      )
    );
  }

  List<String> get _tabBarTitles => [
    AppLocalizations.of(context)!.user_tab_bar_events,
    AppLocalizations.of(context)!.user_tab_bar_friendships,
    AppLocalizations.of(context)!.user_tab_bar_ratings
  ];

  bool get _isSignedInUser => widget.id == KeyValueStorage.getUserId();

  bool get _isProfile => GoRouter.of(context).location == AppRoute.profile.path;

  SCSliverAppBarBackButton? get _backButton => _isProfile
    ? null
    : const SCSliverAppBarBackButton();

  List<SCSliverAppBarButton> get _actionButtons => [
    if (_isProfile) SCSliverAppBarButton(
      onPressed: () {},
      icon: SCIcons.edit
    ),
    if (_isProfile) SCSliverAppBarButton(
      onPressed: () {},
      icon: SCIcons.settings
    ),
    if (!_isSignedInUser) SCSliverAppBarButton(
      onPressed: () {},
      icon: SCIcons.send
    ),
    if (!_isSignedInUser) SCSliverAppBarButton(
      onPressed: () {},
      icon: SCIcons.moreVertical
    )
  ];
}