import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/local_location.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';
import 'package:scial_app_flutter/src/features/location/presentation/widgets/location_text.dart';
import 'package:scial_app_flutter/src/services/location_database_helper.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/*

var placesSearch = PlacesSearch(
    apiKey: 'API Key',
    limit: 5,
);

Future<List<MapBoxPlace>> getPlaces() =>
  placesSearch.getPlaces("New York");

  */

class LocationPage extends ConsumerStatefulWidget {

  const LocationPage({ super.key });

  @override
  ConsumerState<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends ConsumerState<LocationPage> {

  late AutoDisposeStateProvider<bool> isExpandedProvider;

  @override
  void initState() {
    super.initState();

    isExpandedProvider = AutoDisposeStateProvider<bool>((ref) => false);
  }

  @override
  Widget build(BuildContext context) {

    final AsyncValue<List<LocalLocation>> locationsValue = ref.watch(fetchLocalLocationsProvider);
    final bool isExpanded = ref.watch(isExpandedProvider);
    final locationController = ref.watch(locationControllerProvider);

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        appBar: SCAppBar(
          context: context,
          title: SCAppBarTitle(title: AppLocalizations.of(context)!.location_app_bar_title),
          backButton: const SCAppBarBackButton(),
          actionButtons: [
            SCAppBarButton(
              onPressed: _handleRefetch,
              loading: locationController.isLoading,
              enabled: !locationController.hasError,
              icon: SCIcons.navigation
            )
          ],
          searchButton: SCAppBarSearchButton(
            isExpandedProvider: isExpandedProvider,
            hint: AppLocalizations.of(context)!.location_search_hint
          )
        ),
        body: isExpanded
          ? Container()
          : locationsValue.when(
            data: (List<LocalLocation> locations) => locations.isEmpty
              ? LocationText(text: AppLocalizations.of(context)!.location_history_empty)
              : SCLocationList(
                items: List.generate(locations.length, (int index) => SCLocationListItem(name: locations[index].name)),
                addBottomPadding: true,
                onPressed: (int index) {
                  LocalLocation selectedLocation = locations[index];
                  LocationModel location = LocationModel(
                    lat: selectedLocation.lat, 
                    long: selectedLocation.long,
                    name: selectedLocation.name
                  );

                  ref.read(locationControllerProvider.notifier).setLocation(location);

                  context.pop();
                }
              ), 
            error: (Object e, StackTrace s) => const LocationText(text: 'fehler nh'), // TODO 
            loading: () => const SCLocationLoading()
          )
      )
    );
  }

  Future<void> _handleRefetch() async {
    final controller = ref.read(locationControllerProvider.notifier);
    await controller.refetch();
    
    if (context.mounted) context.pop();
  }
}