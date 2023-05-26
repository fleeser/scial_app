import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showUserUpdateSheet(BuildContext context, String? name, bool isPrivate) async {
  
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
      name: name, 
      isPrivate: isPrivate
    )
  );
}

class UserUpdateSheet extends StatefulHookConsumerWidget {

  const UserUpdateSheet({ 
    super.key,
    this.name,
    required this.isPrivate
  });

  final String? name;
  final bool isPrivate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserUpdateSheetState();
}

class _UserUpdateSheetState extends ConsumerState<UserUpdateSheet> {

  late TextEditingController nameController;
  late AutoDisposeStateProvider<bool> isLoadingProvider;

  @override
  void initState() {
    super.initState();

    isLoadingProvider = AutoDisposeStateProvider<bool>((ref) => false);
  }

  @override
  void dispose() {
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);

    final bool isLoading = ref.watch(isLoadingProvider);

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
          SCTextInputField.name(hint: AppLocalizations.of(context)!.user_update_sheet_name_hint),
          const SCGap.semiBig(),
          SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
        ]
      )
    );
  }
}