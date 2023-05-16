import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscoverPage extends ConsumerStatefulWidget {

  const DiscoverPage({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ConsumerState<DiscoverPage> {

  @override
  Widget build(BuildContext context) {
    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.discover_app_bar_title),
        actionButtons: _actionButtons
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
}