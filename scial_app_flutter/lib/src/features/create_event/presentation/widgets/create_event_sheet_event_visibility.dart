import 'package:flutter/material.dart';
import 'package:scial_app_flutter/src/extensions/event_visibility_extension.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateEventSheetEventVisibility extends ConsumerWidget {

  const CreateEventSheetEventVisibility({ 
    super.key,
    required this.eventVisibility,
    required this.onPressed
  });

  final EventVisibility eventVisibility;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SCCircularSelectable(
      emojis: EventVisibility.values.map((EventVisibility visibility) => visibility.emoji).toList(), 
      selectedIndexes: [ eventVisibility.index ], 
      onPressed: onPressed
    );
  }
}