import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/date_time_extension.dart';
import 'package:scial_app_flutter/src/features/user/presentation/controller/friendships_controller.dart';
import 'package:scial_app_flutter/src/features/user/presentation/controller/ratings_controller.dart';
import 'package:scial_app_flutter/src/features/user/presentation/controller/user_controller.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/friendships/user_friendships_loading.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/user_badges.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/friendships/user_friendships_list.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/user_text.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scial_app_flutter/src/extensions/rating_type_extension.dart';

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
    final friendshipsController = ref.watch(friendshipsControllerProvider(widget.id));
    final ratingsController = ref.watch(ratingsControllerProvider(widget.id));

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
              actionButtons: [
                if (!_isSignedInUser) SCSliverAppBarButton(
                  onPressed: _handleFriendship,
                  loading: userController.isLoading,
                  enabled: !userController.hasError,
                  icon: userController.whenOrNull(data: (PublicUser user) => user.friendship != null ? SCIcons.userMinus : user.friendRequest != null ? user.friendRequest!.isSender ? SCIcons.userX : SCIcons.users : SCIcons.userPlus),
                ),
                ..._actionButtons
              ],
              image: SCSliverAppBarImage.url(
                url: userController.whenOrNull(data: (PublicUser user) => user.imageUrl),
                icon: SCIcons.user,
                loading: userController.isLoading,
                error: userController.hasError
              ),
              title: SCSliverAppBarTitle(
                title: userController.whenOrNull(data: (PublicUser user) => user.name ?? AppLocalizations.of(context)!.user_name),
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
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(color: Colors.blue),
                    friendshipsController.when(
                      data: (List<PublicUserFriendship> friendships) => friendships.isNotEmpty
                        ? UserFriendshipsList(
                          addBottomPadding: !_isProfile, 
                          friendships: friendships
                        )
                        : UserText(
                          addBottomPadding: !_isProfile, 
                          text: AppLocalizations.of(context)!.user_friendships_empty_text
                        ),
                      error: (Object e, StackTrace s) => UserText(
                        addBottomPadding: !_isProfile, 
                        text: 'Fehler nh' // TODO
                      ),
                      loading: () => UserFriendshipsLoading(addBottomPadding: !_isProfile)
                    ),
                    SCRatingList(
                      shouldAddBottomPadding: !_isProfile,
                      isLoading: ratingsController.isLoading,
                      hasError: ratingsController.hasError,
                      errorText: 'Fehler nh', // TODO
                      emptyText: AppLocalizations.of(context)!.user_ratings_empty_text,
                      ratingTitle: AppLocalizations.of(context)!.user_ratings_rating_title,
                      ratings: ratingsController.whenOrNull(data: (List<PublicUserRating> ratings) => List.generate(ratings.length, (int index) => SCRatingListItem(
                        image: SCRatingListItemImage.url(url: ratings[index].sender?.imageUrl),
                        name: ratings[index].sender?.name ?? AppLocalizations.of(context)!.user_name,
                        time: ratings[index].created.toDynamicDateText(context),
                        text: ratings[index].text,
                        rating: ratings[index].stars,
                        indicator: SCRatingListItemIndicator(
                          title: ratings[index].type.toText(context), 
                          backgroundColor: ratings[index].type.toBackgroundColor(context)
                        )
                      )))
                    )
                  ]
                )
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
      onPressed: _handleUpdateUser,
      icon: SCIcons.edit,
      enabled: !ref.watch(userControllerProvider(widget.id)).isLoading && !ref.watch(userControllerProvider(widget.id)).hasError
    ),
    if (_isProfile) SCSliverAppBarButton(
      onPressed: () {},
      icon: SCIcons.settings
    ),
    if (!_isSignedInUser) SCSliverAppBarButton(
      onPressed: () {},
      icon: SCIcons.send
    )
  ];

  Future<void> _handleUpdateUser() async {
    final controller = ref.read(userControllerProvider(widget.id).notifier);
    await controller.updateUser(context);
  }

  Future<void> _handleFriendship() async {
    final controller = ref.read(userControllerProvider(widget.id).notifier);
    await controller.handleFriendship(context);
  }
}