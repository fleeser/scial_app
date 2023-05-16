import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/discover/domain/use_cases/discover_read_use_case.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_types.dart';
import 'package:scial_app_flutter/src/services/location_controller.dart';

part 'discover_controller.g.dart';

@riverpod
class DiscoverController extends _$DiscoverController {

  @override
  FutureOr<List<PublicEvent>> build() async {
    return _read();
  }

  Future<List<PublicEvent>> _read() async {
    final LocationModel? location = await ref.watch(locationControllerProvider.future);

    if (location == null) return []; // TODO location

    final List<EventType> eventTypes = ref.watch(filtersEventTypesProvider);

    if (eventTypes.isEmpty) return [];

    return await ref.read(discoverReadUseCaseProvider).call(DiscoverReadUseCaseParams(lat: location.lat, long: location.long, eventTypes: eventTypes));
  }
}