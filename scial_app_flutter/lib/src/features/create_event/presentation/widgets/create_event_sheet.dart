import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/extensions/time_text_extensions.dart';
import 'package:scial_app_flutter/src/extensions/event_type_extension.dart';
import 'package:scial_app_flutter/src/extensions/event_visibility_extension.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/controller/create_event_controller.dart';
import 'package:scial_app_flutter/src/features/create_event/presentation/widgets/create_event_sheet_subtitle.dart';
import 'package:scial_app_flutter/src/features/location/domain/entities/base_location.dart';
import 'package:scial_app_flutter/src/features/location/presentation/controller/location_controller.dart';
import 'package:scial_app_flutter/src/features/search_user/presentation/widgets/select_users_sheet.dart';
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
  late AutoDisposeSatetProvider<EventVisibility> selectedEventVisibilityProvider;
  late AutoDisposeStateProvider<DateTime?> selectedStartDateProvider;
  late AutoDisposeStateProvider<DateTime?> selectedEndDateProvider;
  late AutoDisposeStateProvider<TimeOfDay?> selectedStartTimeProvider;
  late AutoDisposeStateProvider<TimeOfDay?> selectedEndTimeProvider;
  late AutoDisposeStateProvider<BaseLocation?> selectedLocationProvider;

  @override
  void initState() {
    super.initState();

    selectedEventTypeProvider = AutoDisposeStateProvider<EventType>((ref) => EventType.values.first);
    selectedEventVisibilityProviedr = AutoDisposeStateProvider<EventVisibility>((ref) => EventVisibility.values.first);
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
          CreateEventSheetEventType(eventType: selectedEventType),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_visibility_subtitle),
          const SCGap.semiBig(),
          CreateEventSheetEventVisibility(eventVisibility: selectedEventVisibility),
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
          SCPadding(
            padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
            child: locationController.when(
              data: (BaseLocation location) => Row(
                children: [
                  Expanded(
                    child: Text(
                      location.name!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        package: 'scial_app_ui',
                        fontWeight: FontWeight.w400,
                        color: theme.colors.emptyBadges,
                        fontSize: 14.0
                      )
                    )
                  ),
                  const SCGap.regular(),
                  SizedBox(
                    width: 46.0,
                    height: 46.0,
                    child: RawMaterialButton(
                      onPressed: _handleChangeLocation,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(46.0 / 2.0)),
                      fillColor: theme.colors.editableUsersButtonBackground,
                      child: SCIcon(
                        icon: SCIcons.edit2,
                        color: theme.colors.editableUsersButtonIcon,
                        size: 46.0 / 2.0
                      )
                    )
                  )
                ]
              ), 
              error: (Object e, StackTrace s) => Row(
                children: [
                  _locationEmptyText(theme.colors.emptyBadges),
                  const SCGap.regular(),
                  SizedBox(
                    width: 46.0,
                    height: 46.0,
                    child: RawMaterialButton(
                      onPressed: _handleChangeLocation,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(46.0 / 2.0)),
                      fillColor: theme.colors.editableUsersButtonBackground,
                      child: SCIcon(
                        icon: SCIcons.edit2,
                        color: theme.colors.editableUsersButtonIcon,
                        size: 46.0 / 2.0
                      )
                    )
                  )
                ]
              ), 
              loading: () => Row(
                children: [
                  const SCCircularProgressIndicator(
                    size: 20.0,
                    color: Colors.red,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 46.0,
                    height: 46.0,
                    child: RawMaterialButton(
                      onPressed: _handleChangeLocation,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(46.0 / 2.0)),
                      fillColor: theme.colors.editableUsersButtonBackground,
                      child: SCIcon(
                        icon: SCIcons.edit2,
                        color: theme.colors.editableUsersButtonIcon,
                        size: 46.0 / 2.0
                      )
                    )
                  )
                ]
              )
            )
          ),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_hosts_subtitle),
          const SCGap.semiBig(),
          SCEditableUsers(
            onEditPressed: _handleSelectHosts,
            emptyText: AppLocalizations.of(context)!.create_event_sheet_hosts_empty_hosts,
            imageUrls: selectedHosts.map((user) => user.imageUrl).toList()
          ),
          const SCGap.semiBig(),
          CreateEventSheetSubtitle(subtitle: AppLocalizations.of(context)!.create_event_sheet_invitations_subtitle),
          const SCGap.semiBig(),
          SCEditableUsers(
            onEditPressed: _handleSelectGuests,
            emptyText: AppLocalizations.of(context)!.create_event_sheet_invitations_empty_invitations,
            imageUrls: selectedGuests.map((user) => user.imageUrl).toList()
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
    await showSelectUsersSheet(context, selectedHostsProvider);
  }

  Future<void> _handleSelectGuests() async {
    await showSelectUsersSheet(context, selectedGuestsProvider);
  }

  Widget _locationEmptyText(Color color) {
    return Text(
      AppLocalizations.of(context)!.create_event_sheet_location_no_location,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        package: 'scial_app_ui',
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: 14.0
      )
    );
  }
}