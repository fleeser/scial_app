import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/discover/domain/use_cases/discover_read_use_case.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_distance.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_types.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_visibilities.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/base_location.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';

part 'discover_controller.g.dart';

@riverpod
class DiscoverController extends _$DiscoverController {

  @override
  FutureOr<List<PublicEvent>> build(BuildContext context) async {
    return _read(context);
  }

  Future<List<PublicEvent>> _read(BuildContext context) async {
    BaseLocation location = await ref.watch(locationControllerProvider.future);

    if (location == null) return []; // TODO location

    final double distanceValue = ref.watch(filtersDistanceProvider);
    Locale locale = Localizations.localeOf(context); // TODO
    bool isEnglishUS = <Locale>[ const Locale('en'), const Locale('en', 'US') ].contains(locale);
    double distance = isEnglishUS ? distanceValue * 1609.34 : distanceValue * 1000.0;

    final List<EventType> eventTypes = ref.watch(filtersEventTypesProvider);

    if (eventTypes.isEmpty) return [];

    final List<EventVisibility> eventVisibilities = ref.watch(filtersEventVisibilitiesProvider);

    if (eventVisibilities.isEmpty) return [];

    return await ref.read(discoverReadUseCaseProvider).call(DiscoverReadUseCaseParams(lat: location.lat, long: location.long, distance: distance, eventTypes: eventTypes, eventVisibilities: eventVisibilities));
  }
}