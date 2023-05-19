import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';
import 'package:scial_app_flutter/src/routing/app_router.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationCTA extends ConsumerWidget {

  const LocationCTA({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AsyncValue<LocationModel?> locationValue = ref.watch(locationControllerProvider);

    return SCCTA(
      onPressed: () => context.navigateToLocationPage(),
      isLoading: locationValue.isLoading,
      text: locationValue.whenOrNull(data: (LocationModel? location) => location?.name) ?? '',
      buttonTitle: AppLocalizations.of(context)!.home_location_cta_button_title
    );
  }
}