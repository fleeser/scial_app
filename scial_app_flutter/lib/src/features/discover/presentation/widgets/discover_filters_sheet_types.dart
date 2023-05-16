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

class DiscoverFiltersSheetTypes extends StatelessWidget {

  const DiscoverFiltersSheetTypes({ super.key });

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return SizedBox(
      height: 2.0 * SCGapSize.regular.getSpacing(theme) + 56.0,
      child: ListView.builder(
        itemCount: EventType.values.length,
        shrinkWrap: true,
        padding: const SCEdgeInsets.symmetric(vertical: SCGapSize.regular).toEdgeInsets(theme),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => DiscoverFiltersSheetType(
          index: index
        )
      )
    );
  }
}

class DiscoverFiltersSheetType extends ConsumerWidget {

  const DiscoverFiltersSheetType({
    super.key,
    required this.index
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    SCThemeData theme = SCTheme.of(context);

    final List<EventType> selectedEventTypes = ref.watch(filtersEventTypesProvider);

    EventType eventType = EventType.values[index];
    bool isSelected = selectedEventTypes.contains(eventType);

    return SCPadding(
      padding: SCEdgeInsets.only(
        left: index == 0 ? SCGapSize.semiBig : SCGapSize.semiSmall,
        right: index == EventType.values.length - 1 ? SCGapSize.semiBig : SCGapSize.semiSmall
      ),
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colors.discoverFiltersEventTypesBackground,
          border: Border.all(
            width: 2.0,
            color: isSelected
              ? theme.colors.discoverFiltersEventTypesSelectedBorder
              : theme.colors.discoverFiltersEventTypesBackground
          )
        ),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: RawMaterialButton(
            onPressed: () => ref.read(filtersEventTypesProvider.notifier).toggle(eventType),
            elevation: 0.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56.0 / 2.0)),
            child: Text(
              eventType.emoji,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28.0)
            )
          )
        )
      )
    );
  }
}