import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_events_use_case.dart';

part 'events_controller.g.dart';

@riverpod
class EventsController extends _$EventsController {

  @override
  FutureOr<List<PublicEvent>> build(int userId) async {
    return await _read(userId);
  }

  Future<List<PublicEvent>> _read(int userId) async {
    LocationModel? location = await ref.read(locationControllerProvider.future);
    return await ref.read(userEventsUseCaseProvider).call(UserEventsUseCaseParams(userId: userId, lat: location?.lat, long: location!.long));
  }
}