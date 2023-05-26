import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/base_location.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/local_location.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';
import 'package:scial_app_flutter/src/features/location/presentation/widgets/location_text.dart';
import 'package:scial_app_flutter/src/services/location_database_helper.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'location_page.g.dart';

final locationSearchTextProvider = StateProvider<String>((ref) => '');

@riverpod
Future<List<BaseLocation>> locationSearch(LocationSearchRef ref) async {
  String searchText = ref.watch(locationSearchTextProvider);

  List<BaseLocation> locations = [];

  PlacesSearch placesSearch = PlacesSearch(apiKey: dotenv.env['MAPBOX_API_KEY']!);
  List<MapBoxPlace>? results = await placesSearch.getPlaces(searchText);

  if (results != null && results.isNotEmpty) {
    for (MapBoxPlace result in results) {
      if (result.center == null) continue;
      
      BaseLocation location = BaseLocation(
        lat: result.center![0],
        long: result.center![1],
        name: result.placeName
      );

      locations.add(location);
    }
  }

  return locations;
}

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
    final String searchText = ref.watch(locationSearchTextProvider);
    final AsyncValue<List<BaseLocation>> searchValue = ref.watch(locationSearchProvider);

    return SCShimmer(
      linearGradient: scGradient(context),
      child: SCScaffold(
        appBar: SCAppBar(
          context: context,
          title: SCAppBarTitle(title: AppLocalizations.of(context)!.location_app_bar_title),
          backButton: const SCAppBarBackButton(),
          actionButtons: [
            SCAppBarButton(
              onPressed: () => _handleRefetch(context),
              loading: locationController.isLoading,
              enabled: !locationController.hasError,
              icon: SCIcons.navigation
            )
          ],
          searchButton: SCAppBarSearchButton(
            isExpandedProvider: isExpandedProvider,
            hint: AppLocalizations.of(context)!.location_search_hint,
            onChanged: (String searchText) => ref.read(locationSearchTextProvider.notifier).update((state) => state = searchText)
          )
        ),
        body: isExpanded
          ? searchText.isNotEmpty
            ? searchValue.when(
              data: (List<BaseLocation> locations) => locations.isNotEmpty
                ? SCLocationList(
                  items: List.generate(locations.length, (int index) => SCLocationListItem(name: locations[index].name!)),
                  addBottomPadding: true,
                  onPressed: (int index) async {
                    BaseLocation selectedLocation = locations[index];

                    ref.read(locationControllerProvider.notifier).setLocation(selectedLocation);

                    LocalLocation localLocation = LocalLocation(
                      lat: selectedLocation.lat,
                      long: selectedLocation.long,
                      name: selectedLocation.name!,
                      created: DateTime.now()
                    );

                    LocationDatabaseHelper.insertLocation(localLocation);

                    ref.read(locationSearchTextProvider.notifier).update((state) => state = '');

                    context.pop();
                  }
                )
                : LocationText(text: AppLocalizations.of(context)!.location_search_empty),
              error: (Object e, StackTrace s) => const LocationText(text: 'fehler nh'), // TODO , 
              loading: () => const SCLocationLoading(addBottomPadding: true)
            )
            : LocationText(text: AppLocalizations.of(context)!.location_search_empty_search)
          : locationsValue.when(
            data: (List<LocalLocation> locations) => locations.isEmpty
              ? LocationText(text: AppLocalizations.of(context)!.location_history_empty)
              : SCLocationList(
                items: List.generate(locations.length, (int index) => SCLocationListItem(name: locations[index].name)),
                addBottomPadding: true,
                onPressed: (int index) {
                  LocalLocation selectedLocation = locations[index];
                  BaseLocation location = BaseLocation(
                    lat: selectedLocation.lat, 
                    long: selectedLocation.long,
                    name: selectedLocation.name
                  );

                  ref.read(locationControllerProvider.notifier).setLocation(location);

                  context.pop();
                }
              ), 
            error: (Object e, StackTrace s) => const LocationText(text: 'fehler nh'), // TODO 
            loading: () => const SCLocationLoading(addBottomPadding: true)
          )
      )
    );
  }

  Future<void> _handleRefetch(BuildContext context) async {
    final controller = ref.read(locationControllerProvider.notifier);
    bool success = await controller.refetchLocation();

    if (success && mounted) {
      context.pop();
    }
  }
}