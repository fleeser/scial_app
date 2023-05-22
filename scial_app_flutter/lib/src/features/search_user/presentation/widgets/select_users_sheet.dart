import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/search_user/domain/use_cases/search_user_search_use_case.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'select_users_sheet.g.dart';

@riverpod
Future<List<PublicUserSearchUser>> searchUsers(SearchUsersRef ref, String searchText) async {
  return await ref.read(searchUserSearchUseCaseProvider).call(SearchUserSearchUseCaseParams(searchText: searchText));
}

Future<void> showSelectUsersSheet(BuildContext context) async {
  
  SCThemeData theme = SCTheme.of(context);

  await showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
    backgroundColor: theme.colors.sheetBackground,
    builder: (BuildContext context) => const SelectUsersSheet()
  );
}

class SelectUsersSheet extends ConsumerStatefulWidget {

  const SelectUsersSheet({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectUsersSheetState();
}

class _SelectUsersSheetState extends ConsumerState<SelectUsersSheet> {

  late AutoDisposeStateProvider<bool> isExpandedProvider;
  late AutoDisposeStateProvider<String> searchTextProvider;

  @override
  void initState() {
    super.initState();

    isExpandedProvider = AutoDisposeStateProvider<bool>((ref) => false);
    searchTextProvider = AutoDisposeStateProvider<String>((ref) => '');
  }

  @override
  Widget build(BuildContext context) {
    
    SCThemeData theme = SCTheme.of(context);

    final bool isExpanded = ref.watch(isExpandedProvider);
    final String searchText = ref.watch(searchTextProvider);
    final AsyncValue<List<PublicUserSearchUser>> searchUsersValue = ref.watch(searchUsersProvider(searchText));

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
                Expanded(
                  child: SCAnimatedVisibilityWidget(
                    isVisible: !isExpanded, 
                    child: SCText.sheetTitle(AppLocalizations.of(context)!.select_users_sheet_title)
                  )
                ),
                SCAnimatedVisibilityWidget(
                  isVisible: !isExpanded, 
                  child: const SCGap.semiBig()
                ),
                SCAppBarSearchButton(
                  isExpandedProvider: isExpandedProvider, 
                  hint: AppLocalizations.of(context)!.select_users_sheet_search_hint,
                  onChanged: (String text) => ref.read(searchTextProvider.notifier).update((state) => state = text),
                ),
                SCAnimatedVisibilityWidget(
                    isVisible: !isExpanded, 
                    child: const SCGap.regular()
                ),
                SCAnimatedVisibilityWidget(
                  isVisible: !isExpanded, 
                  child: const SCSheetCloseButton(isEnabled: true)
                )
              ]
            )
          ),
          const SCGap.semiBig(),
          searchText.isNotEmpty
              ? searchUsersValue.when(
                data: (List<PublicUserSearchUser> users) => users.isEmpty
                  ? Text('empty')
                  : Text(users.length.toString()), 
                error: (Object e, StackTrace s) => Text(e.toString()), // TODO fehler nh 
                loading: () => Text('lädt')
              )
              : Text('gib was ein')
          ,
          SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
        ]
      )
    );
  }
}