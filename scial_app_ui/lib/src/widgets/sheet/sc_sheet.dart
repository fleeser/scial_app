import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/widgets/sheet/sc_sheet_button.dart';
import 'package:scial_app_ui/src/widgets/sheet/sc_sheet_close_button.dart';

Future<void> showSCSheet(BuildContext context, { required String title, required SCSheetButton button, List<Widget> Function(bool)? children }) async {

  SCThemeData theme = SCTheme.of(context);

  await showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    isDismissible: false,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
    backgroundColor: theme.colors.sheetBackground,
    builder: (BuildContext context) => SCSheet(
      title: title,
      button: button,
      children: children
    )
  );
}

class SCSheet extends ConsumerStatefulWidget {

  const SCSheet({
    super.key,
    required this.title,
    required this.button,
    this.children
  });

  final String title;
  final SCSheetButton button;
  final List<Widget> Function(bool)? children;

  @override
  ConsumerState<SCSheet> createState() => _SCSheetState();
}

class _SCSheetState extends ConsumerState<SCSheet> {

  late AutoDisposeStateProvider<bool> isLoadingProvider;

  @override
  void initState() {
    super.initState();

    isLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
  }

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    final bool isLoading = ref.watch(isLoadingProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SCGap.semiBig(),
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: Row(
            children: [
              Expanded(child: SCText.sheetTitle(widget.title)),
              const SCGap.semiBig(),
              SCSheetCloseButton(isEnabled: !isLoading)
            ]
          )
        ),
        if ((widget.children?.call(isLoading) ?? []).isNotEmpty) const SCGap.semiBig(),
        if ((widget.children?.call(isLoading) ?? []).isNotEmpty) ...widget.children!.call(isLoading),
        const SCGap.semiBig(),
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: SCSheetButtonWidget(
            onPressed: () => _onPressed(isLoading),
            title: widget.title,
            isLoading: isLoading,
            isEnabled: !isLoading
          )
        ),
        SizedBox(height: SCGapSize.semiBig.getSpacing(theme) + (MediaQuery.of(context).viewInsets.bottom > 0.0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom))
      ]
    );
  }

  Future<void> _onPressed(bool isLoading) async {
    if (widget.button.onPressed == null) {
      return Navigator.pop(context);
    }

    if (_isFuture) {
      ref.read(isLoadingProvider.notifier).update((state) => state = true);
    }

    bool success = await widget.button.onPressed!.call();

    if (success && context.mounted) {
      return Navigator.pop(context);
    }

    if (_isFuture) {
      ref.read(isLoadingProvider.notifier).update((state) => state = false);
    }
  }

  bool get _isFuture => widget.button.onPressed!.runtimeType is! Future Function(); // TODO bug: Shows loading even if is no future
}