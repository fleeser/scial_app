import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/event_visibility_extension.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class FiltersEventVisibilitiesNotifier extends StateNotifier<List<EventVisibility>> {

  FiltersEventVisibilitiesNotifier() : super(EventVisibility.values);

  void toggle(EventVisibility selectedVisibility) {
    if (state.contains(selectedVisibility)) {
      state = [
        for (final type in state)
          if (type != selectedVisibility) type
      ];
    } else {
      state = [ ...state, selectedVisibility ];
    }
  }
}

final filtersEventVisibilitiesProvider = StateNotifierProvider<FiltersEventVisibilitiesNotifier, List<EventVisibility>>((ref) => FiltersEventVisibilitiesNotifier());

class DiscoverFiltersSheetVisibilities extends ConsumerWidget {

  const DiscoverFiltersSheetVisibilities({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<EventVisibility> selectedVisibilities = ref.watch(filtersEventVisibilitiesProvider);

    return SCCircularSelectable(
      emojis: EventVisibility.values.map((EventVisibility eventVisibility) => eventVisibility.emoji).toList(), 
      selectedIndexes: selectedVisibilities.map((EventVisibility eventVisibility) => eventVisibility.index).toList(), 
      onPressed: (int index) => ref.read(filtersEventVisibilitiesProvider.notifier).toggle(EventVisibility.values[index])
    );
  }
}