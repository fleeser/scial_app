import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_flutter/src/features/user/presentation/controller/user_controller.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showUserUpdateSheet(BuildContext context, int userId, String? name, bool isPrivate) async {
  
  SCThemeData theme = SCTheme.of(context);

  await showModalBottomSheet( // TODO: Top padding
    context: context, 
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
    backgroundColor: theme.colors.sheetBackground,
    builder: (BuildContext context) => UserUpdateSheet(
      userId: userId,
      name: name, 
      isPrivate: isPrivate
    )
  );
}

class UserUpdateSheet extends StatefulHookConsumerWidget {

  const UserUpdateSheet({ 
    super.key,
    required this.userId,
    this.name,
    required this.isPrivate
  });

  final int userId;
  final String? name;
  final bool isPrivate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserUpdateSheetState();
}

class _UserUpdateSheetState extends ConsumerState<UserUpdateSheet> {

  late TextEditingController nameController;
  late AutoDisposeStateProvider<bool> isLoadingProvider;
  late AutoDisposeStateProvider<bool> isPrivateProvider;

  @override
  void initState() {
    super.initState();

    isLoadingProvider = AutoDisposeStateProvider<bool>((ref) => false);
    isPrivateProvider = AutoDisposeStateProvider<bool>((ref) => widget.isPrivate);
  }

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);

    final bool isLoading = ref.watch(isLoadingProvider);
    final bool isPrivate = ref.watch(isPrivateProvider);

    nameController = useTextEditingController(text: widget.name);

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
                Expanded(child: SCText.sheetTitle(AppLocalizations.of(context)!.user_update_sheet_title)),
                const SCGap.semiBig(),
                SCSheetCloseButton(isEnabled: !isLoading)
              ]
            )
          ),
          const SCGap.semiBig(),
          SCPadding(
            padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
            child: SCTextInputField.name(hint: AppLocalizations.of(context)!.user_update_sheet_name_hint)
          ),
          const SCGap.semiBig(),
          SCPadding(
            padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
            child: Row(
              children: [
                Expanded(child: SCText.updateUserIsPrivate(AppLocalizations.of(context)!.user_update_sheet_is_private_text)),
                const SCGap.semiBig(),
                SCSwitch(
                  isOn: isPrivate, 
                  onChanged: (bool value) => ref.read(isPrivateProvider.notifier).update((state) => value)
                )
              ]
            )
          ),
          const SCGap.semiBig(),
          SCPadding(
            padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
            child: SCButton.filled(
              onPressed: _handleUpdate,
              isLoading: isLoading,
              title: AppLocalizations.of(context)!.user_update_sheet_update_button_title
            )
          ),
          SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
        ]
      )
    );
  }

  Future<void> _handleUpdate() async {
    ref.read(isLoadingProvider.notifier).update((state) => true);

    final controller = ref.read(userControllerProvider(widget.userId).notifier);
    bool isPrivate = ref.read(isPrivateProvider);

    bool success = false;
    try {
      success = await controller.updateUser(nameController.text, isPrivate);
    } catch (_) { }

    if (success && mounted) {
      context.pop();
    } else {
      ref.read(isLoadingProvider.notifier).update((state) => false);
    }
  }
}