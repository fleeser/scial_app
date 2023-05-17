import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltersEventDistanceNotifier extends StateNotifier<double> {

  FiltersEventDistanceNotifier() : super(1);

  void update(double value) {
    state = value;
  }
}

final filtersDistanceProvider = StateNotifierProvider<FiltersEventDistanceNotifier, double>((ref) => FiltersEventDistanceNotifier());

class DiscoverFiltersSheetDistance extends ConsumerWidget {

  const DiscoverFiltersSheetDistance({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final double ticks = ref.watch(filtersDistanceProvider);

    return SCPadding(
      padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
      child: Row(
        children: [
          Expanded(
            child: SCSlider(
              onChanged: (double value) => ref.read(filtersDistanceProvider.notifier).update(value),
              min: 1.0,
              max: 10.0,
              divisions: 10,
              value: ticks
            )
          ),
          const SCGap.regular(),
          SCText.discoverFiltersDistance('${ticks.toInt()} ${ AppLocalizations.of(context)!.discover_filters_distance_short }')
        ]
      )
    );
  }
}