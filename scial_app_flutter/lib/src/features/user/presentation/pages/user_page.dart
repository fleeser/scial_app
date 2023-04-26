import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/presentation/controller/user_controller.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

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

  @override
  Widget build(BuildContext context) {

    final userAsync = ref.watch(userControllerProvider(widget.id));

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        body: CustomScrollView(
          slivers: [
            SCSliverAppBar(
              context: context,
              backButton: _backButton,
              actionButtons: _actionButtons,
              image: SCSliverAppBarImage.url(
                url: userAsync.whenOrNull(data: (PublicUser user) => user.imageUrl),
                icon: SCIcons.user,
                loading: userAsync.isLoading,
                error: userAsync.hasError
              ),
              title: SCSliverAppBarTitle(
                title: userAsync.whenOrNull(data: (PublicUser user) => user.name ?? 'scial user'),
                loading: userAsync.isLoading,
                error: userAsync.hasError
              )
            ),
            SliverToBoxAdapter(child: Container(height: 10000))
          ]
        )
      )
    );
  }

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