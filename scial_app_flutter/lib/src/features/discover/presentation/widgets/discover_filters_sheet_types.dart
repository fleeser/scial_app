import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/event_type_extension.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class FiltersEventTypesNotifier extends StateNotifier<List<EventType>> {

  FiltersEventTypesNotifier() : super(EventType.values);

  void toggle(EventType selectedType) {
    if (state.contains(selectedType)) {
      state = [
        for (final type in state)
          if (type != selectedType) type
      ];
    } else {
      state = [ ...state, selectedType ];
    }
  }
}

final filtersEventTypesProvider = StateNotifierProvider<FiltersEventTypesNotifier, List<EventType>>((ref) => FiltersEventTypesNotifier());

class DiscoverFiltersSheetTypes extends ConsumerWidget {

  const DiscoverFiltersSheetTypes({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<EventType> selectedEventTypes = ref.watch(filtersEventTypesProvider);

    return SCCircularSelectable(
      emojis: EventType.values.map((EventType eventType) => eventType.emoji).toList(), 
      selectedIndexes: selectedEventTypes.map((EventType eventType) => eventType.index).toList(), 
      onPressed: (int index) => ref.read(filtersEventTypesProvider.notifier).toggle(EventType.values[index])
    );
  }
}