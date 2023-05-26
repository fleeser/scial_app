import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/extensions/event_type_extension.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateEventSheetEventType extends ConsumerWidget {

  const CreateEventSheetEventType({ 
    super.key,
    required this.eventType,
    required this.onPressed
  });

  final EventType eventType;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SCCircularSelectable(
      emojis: EventType.values.map((EventType type) => type.emoji).toList(), 
      selectedIndexes: [ eventType.index ], 
      onPressed: onPressed
    );
  }
}