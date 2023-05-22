import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/local_location.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';
import 'package:scial_app_flutter/src/features/location/presentation/pages/location_page.dart';
import 'package:scial_app_flutter/src/features/location/presentation/widgets/location_text.dart';
import 'package:scial_app_flutter/src/services/location_database_helper.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showLocationSheet(BuildContext context) async {
  
  SCThemeData theme = SCTheme.of(context);

  await showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
    backgroundColor: theme.colors.sheetBackground,
    builder: (BuildContext context) => const LocationSheet()
  );
}

class LocationSheet extends ConsumerStatefulWidget {

  const LocationSheet({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationSheetState();
}

class _LocationSheetState extends ConsumerState<LocationSheet> {

  late AutoDisposeStateProvider<bool> isExpandedProvider;

  @override
  void initState() {
    super.initState();

    isExpandedProvider = AutoDisposeStateProvider<bool>((ref) => false);
  }

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);

    final AsyncValue<List<LocalLocation>> locationsValue = ref.watch(fetchLocalLocationsProvider);
    final bool isExpanded = ref.watch(isExpandedProvider);
    final String searchText = ref.watch(locationSearchTextProvider);
    final AsyncValue<List<LocationModel>> searchValue = ref.watch(locationSearchProvider);

    return SCShimmer(
      linearGradient: scGradient(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SCGap.semiBig(),
          SCPadding(
            padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
            child: Row(
              children: [
                Expanded(
                  child: SCAnimatedVisibilityWidget(
                    isVisible: !isExpanded, 
                    child: SCText.sheetTitle(AppLocalizations.of(context)!.location_sheet_title)
                  )
                ),
                SCAnimatedVisibilityWidget(
                  isVisible: !isExpanded, 
                  child: const SCGap.semiBig()
                ),
                SCAppBarSearchButton(
                  isExpandedProvider: isExpandedProvider, 
                  hint: AppLocalizations.of(context)!.location_sheet_search_hint,
                  onChanged: (String searchText) => ref.read(locationSearchTextProvider.notifier).update((state) => state = searchText)
                ),
                SCAnimatedVisibilityWidget(
                    isVisible: !isExpanded, 
                    child: const SCGap.regular()
                ),
                SCAnimatedVisibilityWidget(
                  isVisible: !isExpanded, 
                  child: const SCSheetCloseButton(isEnabled: true)
                )
              ]
            )
          ),
          const SCGap.semiBig(),
          Expanded(
            child: isExpanded
            ? searchText.isNotEmpty
              ? searchValue.when(
                data: (List<LocationModel> locations) => locations.isNotEmpty
                  ? SCLocationList(
                    items: List.generate(locations.length, (int index) => SCLocationListItem(name: locations[index].name!)),
                    addBottomPadding: true,
                    onPressed: (int index) async {
                      LocationModel selectedLocation = locations[index];

                      ref.read(locationControllerProvider.notifier).setLocation(selectedLocation);

                      LocalLocation localLocation = LocalLocation(
                        lat: selectedLocation.lat,
                        long: selectedLocation.long,
                        name: selectedLocation.name!,
                        created: DateTime.now()
                      );

                      LocationDatabaseHelper.insertLocation(localLocation);

                      ref.read(locationSearchTextProvider.notifier).update((state) => state = '');

                      Navigator.pop(context);
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
              loading: () => const SCLocationLoading(addBottomPadding: true)
            )
          ),
          SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
        ]
      )
    );
  }
}