import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateEventSheetEventVisibility extends ConsumerWidget {

  const CreateEventSheetEventVisibility({ 
    super.key,
    required this.eventVisibility
  });

  final EventVisibility eventVisibility;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SCCircularSelectable(
      emojis: EventVisibility.values.map((EventVisibility visibility) => visibility.emoji).toList(), 
      selectedIndexes: [ eventVisibility.index ], 
      onPressed: (int index) => ref.read(createEventSelectedEventVisibilityProvider.notifier).update((state) => state = EventVisibility.values[index])
    );
  }
}