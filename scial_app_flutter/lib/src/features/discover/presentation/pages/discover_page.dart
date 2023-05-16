import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/controller/discover_controller.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet.dart';
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

    final discoverController = ref.watch(discoverControllerProvider);

    _tabController = useTabController(initialLength: _tabBarTitles.length);

    return SCScaffold(
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
            child: discoverController.when(
              data: (List<PublicEvent> events) => events.isNotEmpty
                ? Text('is da')
                : Text('leer'), 
              error: (Object e, StackTrace s) => Text('fehler'), 
              loading: () => Text('lol')
            )
          )
        ]
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
}