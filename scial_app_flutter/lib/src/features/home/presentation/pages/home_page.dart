import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/base_location.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';
import 'package:scial_app_flutter/src/features/scial_day/presentation/widgets/scial_day_cta.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {

  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AsyncValue<BaseLocation> location = ref.watch(locationControllerProvider);

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        appBar: SCAppBar(
          context: context,
          title: SCAppBarTitle(
            title: '📍 ${ location.whenOrNull(data: (BaseLocation location) => location.name ?? AppLocalizations.of(context)!.location_no_name) }',
            loading: location.isLoading,
            error: location.hasError
          ),
          actionButtons: _actionButtons(context)
        ),
        body: const Column(
          children: [
            ScialDayCTA()
          ]
        )
      )
    );
  }

  List<SCAppBarButton> _actionButtons(BuildContext context) {
    return [
      SCAppBarButton(icon: SCIcons.book, onPressed: () => context.navigateToLocationPage()),
      const SCAppBarButton(icon: SCIcons.send)
    ];
  }
}