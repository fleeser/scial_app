import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/controller/create_event_controller.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_description.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_event_type.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_event_visibility.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_location.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_subtitle.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_time.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_title.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/base_location.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showCreateEventSheet(BuildContext context) async {
  
  SCThemeData theme = SCTheme.of(context);

  await showModalBottomSheet( // TODO: Top padding
    context: context, 
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
    backgroundColor: theme.colors.sheetBackground,
    builder: (BuildContext context) => const CreateEventSheet() // TODO: Hosts and guests can not be in one
  );
}

class CreateEventSheet extends StatefulHookConsumerWidget {

  const CreateEventSheet({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateEventSheetState();
}

class _CreateEventSheetState extends ConsumerState<CreateEventSheet> {

  late TextEditingController selectedTitleController;
  late TextEditingController selectedDescriptionController;
  late AutoDisposeStateProvider<EventType> selectedEventTypeProvider;
  late AutoDisposeStateProvider<EventVisibility> selectedEventVisibilityProvider;
  late AutoDisposeStateProvider<DateTime?> selectedStartDateProvider;
  late AutoDisposeStateProvider<DateTime?> selectedEndDateProvider;
  late AutoDisposeStateProvider<TimeOfDay?> selectedStartTimeProvider;
  late AutoDisposeStateProvider<TimeOfDay?> selectedEndTimeProvider;
  late AutoDisposeStateProvider<BaseLocation?> selectedLocationProvider;

  @override
  void initState() {
    super.initState();

    selectedEventTypeProvider = AutoDisposeStateProvider<EventType>((ref) => EventType.values.first);
    selectedEventVisibilityProvider = AutoDisposeStateProvider<EventVisibility>((ref) => EventVisibility.values.first);
    selectedStartDateProvider = AutoDisposeStateProvider<DateTime?>((ref) => null);
    selectedEndDateProvider = AutoDisposeStateProvider<DateTime?>((ref) => null);
    selectedStartTimeProvider = AutoDisposeStateProvider<TimeOfDay?>((ref) => null);
    selectedEndTimeProvider = AutoDisposeStateProvider<TimeOfDay?>((ref) => null);
    selectedLocationProvider = AutoDisposeStateProvider<BaseLocation?>((ref) => null);
  }

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);

    final createEventController = ref.watch(createEventControllerProvider);

    final EventType selectedEventType = ref.watch(selectedEventTypeProvider);
    final EventVisibility selectedEventVisibility = ref.watch(selectedEventVisibilityProvider);
    final DateTime? selectedStartDate = ref.watch(selectedStartDateProvider);
    final DateTime? selectedEndDate = ref.watch(selectedEndDateProvider);
    final TimeOfDay? selectedStartTime = ref.watch(selectedStartTimeProvider);
    final TimeOfDay? selectedEndTime = ref.watch(selectedEndTimeProvider);
    final BaseLocation? selectedLocation = ref.watch(selectedLocationProvider);

    selectedTitleController = useTextEditingController();
    selectedDescriptionController = useTextEditingController();

    return SingleChildScrollView(
      child: Column(
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
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_title_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetTitle(controller: selectedTitleController),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_description_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetDescription(controller: selectedDescriptionController),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_type_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetEventType(
            eventType: selectedEventType,
            onPressed: (int index) => ref.read(selectedEventTypeProvider.notifier).update((state) => state = EventType.values[index])
          ),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_visibility_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetEventVisibility(
            eventVisibility: selectedEventVisibility,
            onPressed: (int index) => ref.read(selectedEventVisibilityProvider.notifier).update((state) => state = EventVisibility.values[index])
          ),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_start_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetTime(
            date: selectedStartDate,
            time: selectedStartTime,
            onDateSelected: (DateTime date) => ref.read(selectedStartDateProvider.notifier).update((state) => state = date),
            onTimeSelected: (TimeOfDay time) => ref.read(selectedStartTimeProvider.notifier).update((state) => state = time)
          ),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_end_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetTime(
            date: selectedEndDate,
            time: selectedEndTime,
            onDateSelected: (DateTime date) => ref.read(selectedEndDateProvider.notifier).update((state) => state = date),
            onTimeSelected: (TimeOfDay time) => ref.read(selectedEndTimeProvider.notifier).update((state) => state = time)
          ),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_location_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetLocation(location: selectedLocation),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_hosts_subtitle),
          const SCGap.semiBig(),
          SCEditableUsers(
            onEditPressed: _handleSelectHosts,
            emptyText: AppLocalizations.of(context)!.create_event_sheet_hosts_empty_hosts,
            imageUrls: const []
          ),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_invitations_subtitle),
          const SCGap.semiBig(),
          SCEditableUsers(
            onEditPressed: _handleSelectGuests,
            emptyText: AppLocalizations.of(context)!.create_event_sheet_invitations_empty_invitations,
            imageUrls: const []
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
          SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
        ]
      )
    );
  }

  Future<void> _handleCreate() async {
    final controller = ref.read(createEventControllerProvider.notifier);
    await controller.createEvent();
  }

  Future<void> _handleChangeLocation() async {
    // TODO await showLocationSheet(context);
  }

  Future<void> _handleSelectHosts() async {
    //await showSelectUsersSheet(context, selectedHostsProvider);
  }

  Future<void> _handleSelectGuests() async {
    //await showSelectUsersSheet(context, selectedGuestsProvider);
  }
}