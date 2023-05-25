import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateEventSheetEventType extends ConsumerWidget {

  const CreateEventSheetEventType({ 
    super.key,
    required this.eventType
  });

  final EventType eventType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SCCircularSelectable(
      emojis: EventType.values.map((EventType type) => type.emoji).toList(), 
      selectedIndexes: [ eventType.index ], 
      onPressed: (int index) => ref.read(createEventSelectedEventTypeProvider.notifier).update((state) => state = EventType.values[index])
    );
  }
}