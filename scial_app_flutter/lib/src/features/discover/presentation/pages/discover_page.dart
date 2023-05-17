import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/common/event_list/event_list.dart';
import 'package:scial_app_flutter/src/common/event_list/event_list_loading.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/controller/discover_controller.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_text.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscoverPage extends StatefulHookConsumerWidget {

  const DiscoverPage({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ConsumerState<DiscoverPage> {

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {

    final discoverController = ref.watch(discoverControllerProvider(context));

    _tabController = useTabController(initialLength: _tabBarTitles.length);

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        appBar: SCAppBar(
          context: context,
          title: SCAppBarTitle(title: AppLocalizations.of(context)!.discover_app_bar_title),
          actionButtons: _actionButtons
        ),
        body: Column(
          children: [
            SCTabBar(
              controller: _tabController,
              titles: _tabBarTitles
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(_tabBarTitles.length, (int index) => discoverController.when(
                  data: (List<PublicEvent> events) {

                    List<PublicEvent> filteredEvents = _filterEvents(events, index);

                    return filteredEvents.isNotEmpty
                      ? EventList(events: filteredEvents)
                      : DiscoverText(text: AppLocalizations.of(context)!.discover_events_empty);
                  }, 
                  error: (Object e, StackTrace s) => const DiscoverText(text: 'fehler'), // TODO, 
                  loading: () => const EventListLoading()
                ))
              )
            )
          ]
        )
      )
    );
  }

  List<SCAppBarButton> get _actionButtons {
    return [
      SCAppBarButton(
        onPressed: () async => await showDiscoverFiltersSheet(context),
        icon: SCIcons.filter
      )
    ];
  }

  List<String> get _tabBarTitles => [
    AppLocalizations.of(context)!.discover_tab_bar_all,
    AppLocalizations.of(context)!.discover_tab_bar_coming,
    AppLocalizations.of(context)!.discover_tab_bar_ongoing
  ];

  List<PublicEvent> _filterEvents(List<PublicEvent> events, int index) {
    switch (index) {
      case 0: return events;
      case 1: return events.where((PublicEvent event) => event.start.isAfter(DateTime.now())).toList();
      default: return events.where((PublicEvent event) => event.start.isBefore(DateTime.now()) || event.start.isAtSameMomentAs(DateTime.now())).toList();
    }
  }
}