import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/event/presentation/controller/guests_controller.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventPage extends StatefulHookConsumerWidget {

  const EventPage({
    super.key,
    required this.id
  });

  final int id;

  @override
  ConsumerState<EventPage> createState() => _EventPageState();
}

class _EventPageState extends ConsumerState<EventPage> {

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {

    _tabController = useTabController(initialLength: _tabBarTitles.length);

    final guestsController = ref.watch(guestsControllerProvider(widget.id));

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        body: ExtendedNestedScrollView(
          pinnedHeaderSliverHeightBuilder: () => MediaQuery.of(context).padding.top + kToolbarHeight,
          onlyOneScrollInBody: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SCSliverAppBar(
              context: context,
              backButton: const SCSliverAppBarBackButton(),
              actionButtons: _actionButtons,
            )
          ],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SCTabBar(
                controller: _tabController, 
                titles: _tabBarTitles
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(),
                    guestsController.when(
                      data: (List<PublicEventFullGuest> guests) => Text('geil'),
                      error: (Object e, StackTrace s) => Text('err'),
                      loading: () => Text('lädt')
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
    AppLocalizations.of(context)!.event_tab_bar_general,
    AppLocalizations.of(context)!.event_tab_bar_guests
  ];

  List<SCSliverAppBarButton> get _actionButtons {
    return [
      const SCSliverAppBarButton(icon: SCIcons.book),
      const SCSliverAppBarButton(icon: SCIcons.send)
    ];
  }
}