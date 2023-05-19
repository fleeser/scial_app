import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/controller/create_event_controller.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_subtitle.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showCreateEventSheet(BuildContext context) async {
  
  SCThemeData theme = SCTheme.of(context);

  await showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
    backgroundColor: theme.colors.sheetBackground,
    builder: (BuildContext context) => const CreateEventSheet()
  );
}

class CreateEventSheet extends ConsumerStatefulWidget {

  const CreateEventSheet({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateEventSheetState();
}

class _CreateEventSheetState extends ConsumerState<CreateEventSheet> {

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);

    final createEventController = ref.watch(createEventControllerProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SCGap.semiBig(),
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: Row(
            children: [
              Expanded(child: SCText.sheetTitle(AppLocalizations.of(context)!.create_event_sheet_title)),
              const SCGap.semiBig(),
              const SCSheetCloseButton(isEnabled: true)
            ]
          )
        ),
        const SCGap.semiBig(),
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: SCButton.filled(
            onPressed: _handleCreate,
            title: AppLocalizations.of(context)!.create_event_sheet_create_button_title,
            isLoading: createEventController.isLoading,
            isEnabled: !createEventController.isLoading && !createEventController.hasError
          )
        ),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_title_subtitle),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_description_subtitle),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_type_subtitle),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_visibility_subtitle),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_time_subtitle),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_location_subtitle),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_hosts_subtitle),
        const SCGap.semiBig(),
        CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_invitations_subtitle),
        SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
      ]
    );
  }

  Future<void> _handleCreate() async {
    final controller = ref.read(createEventControllerProvider.notifier);
    await controller.createEvent();
  }
}