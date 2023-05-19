import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationPage extends StatefulWidget {

  const LocationPage({ super.key });

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  late AutoDisposeStateProvider<bool> isExpandedProvider;

  @override
  void initState() {
    super.initState();

    isExpandedProvider = AutoDisposeStateProvider<bool>((ref) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SCScaffold(
      appBar: SCAppBar(
        context: context,
        title: SCAppBarTitle(title: AppLocalizations.of(context)!.location_app_bar_title),
        actionButtons: _actionButtons,
        searchButton: SCAppBarSearchButton(isExpandedProvider: isExpandedProvider),
      ),
      body: Container()
    );
  }

  List<SCAppBarButton> get _actionButtons {
    return [
      SCAppBarButton(
        onPressed: () {},
        icon: SCIcons.navigation
      )
    ];
  }
}