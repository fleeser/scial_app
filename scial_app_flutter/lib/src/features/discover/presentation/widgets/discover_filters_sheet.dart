import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_distance.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_title.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_types.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/widgets/discover_filters_sheet_visibilities.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showDiscoverFiltersSheet(BuildContext context) async {
  
  SCThemeData theme = SCTheme.of(context);

  await showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
    backgroundColor: theme.colors.sheetBackground,
    builder: (BuildContext context) => const DiscoverFiltersSheet()
  );
}

class DiscoverFiltersSheet extends StatelessWidget {

  const DiscoverFiltersSheet({ super.key });

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SCGap.semiBig(),
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: Row(
            children: [
              Expanded(child: SCText.sheetTitle(AppLocalizations.of(context)!.discover_filters_sheet_title)),
              const SCGap.semiBig(),
              const SCSheetCloseButton(isEnabled: true)
            ]
          )
        ),
        const SCGap.semiBig(),
        DiscoverFiltersSheetTitle(title: AppLocalizations.of(context)!.discover_filters_distance_title),
        const SCGap.semiBig(),
        const DiscoverFiltersSheetDistance(),
        const SCGap.semiBig(),
        DiscoverFiltersSheetTitle(title: AppLocalizations.of(context)!.discover_filters_event_types_title),
        const SCGap.semiBig(),
        const DiscoverFiltersSheetTypes(),
        const SCGap.semiBig(),
        DiscoverFiltersSheetTitle(title: AppLocalizations.of(context)!.discover_filters_event_visibilities_title),
        const SCGap.semiBig(),
        const DiscoverFiltersSheetVisibilities(),
        SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
      ]
    );
  }
}