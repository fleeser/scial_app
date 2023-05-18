import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/event/domain/use_cases/event_guests_use_case.dart';

part 'guests_controller.g.dart';

@riverpod
class GuestsController extends _$GuestsController {

  @override
  FutureOr<List<PublicEventFullGuest>> build(int eventId) async {
    return await _read(eventId);
  }

  Future<List<PublicEventFullGuest>> _read(int eventId) async {
    return await ref.read(eventGuestsUseCaseProvider).call(EventGuestsUseCaseParams(eventId: eventId));
  }
}