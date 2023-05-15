import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class UserUpdateUserSwitch extends ConsumerStatefulWidget {

  const UserUpdateUserSwitch({
    super.key,
    required this.initialIsOn,
    required this.onChanged
  });

  final bool initialIsOn;
  final void Function(bool) onChanged;

  @override
  ConsumerState<UserUpdateUserSwitch> createState() => _UserUpdateUserSwitchState();
}

class _UserUpdateUserSwitchState extends ConsumerState<UserUpdateUserSwitch> {

  late StateProvider<bool> isOnProvider;

  @override
  void initState() {
    super.initState();

    isOnProvider = StateProvider<bool>((ref) => widget.initialIsOn);
  }
  
  @override
  Widget build(BuildContext context) {

    final bool isOn = ref.watch(isOnProvider);

    return SCSwitch(
      isOn: isOn, 
      onChanged: (bool value) {
        ref.read(isOnProvider.notifier).update((state) => state = value);
        widget.onChanged.call(value);
      }
    );
  }
}