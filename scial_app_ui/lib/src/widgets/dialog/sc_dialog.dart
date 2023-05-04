import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:scial_app_ui/src/widgets/dialog/sc_dialog_button.dart';

Future<void> showSCDialog(BuildContext context, { required String title, required String text, required List<SCDialogButton> buttons }) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => SCDialog(
      title: title, 
      text: text,
      buttons: buttons
    )
  );
}

Future<void> showSCDialogYesNo(BuildContext context, { required String title, required String text, required SCDialogYesNoButton yesButton, required SCDialogYesNoButton noButton }) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => SCDialog.yesNo(
      title: title, 
      text: text,
      buttons: [ 
        SCDialogButton(
          onPressed: yesButton.onPressed,
          title: yesButton.title,
          isPrimary: true
        ),
        SCDialogButton(
          onPressed: noButton.onPressed,
          title: noButton.title,
          isPrimary: false
        )
      ]
    )
  );
}

class SCDialog extends ConsumerStatefulWidget {

  const SCDialog({
    super.key,
    required this.title,
    required this.text,
    required this.buttons
  });

  const SCDialog.yesNo({
    super.key,
    required this.title,
    required this.text,
    required this.buttons
  });

  final String title;
  final String text;
  final List<SCDialogButton> buttons;

  @override
  ConsumerState<SCDialog> createState() => _SCDialogState();
}

class _SCDialogState extends ConsumerState<SCDialog> {

  late AutoDisposeStateProvider<Map<int, bool>> isLoadingProvider;

  @override
  void initState() {
    super.initState();

    isLoadingProvider = StateProvider.autoDispose<Map<int, bool>>((ref) => { for (int i = 0; i < widget.buttons.length; i++) i : false });
  }

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    Map<int, bool> isLoadingMap = ref.watch(isLoadingProvider);

    return Center(
      child: SCPadding.semiBig(
        child: Container(
          width: double.infinity,
          padding: const SCEdgeInsets.semiBig().toEdgeInsets(theme),
          decoration: BoxDecoration(
            color: theme.colors.dialogBackground,
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SCText.dialogTitle(widget.title),
              const SCGap.semiBig(),
              SCText.dialogText(widget.text),
              const SCGap.semiBig(),
              Row(
                children: List.generate(widget.buttons.length, (int index) => Expanded(
                  child: SCPadding(
                    padding: SCEdgeInsets.only(
                      left: index == 0 ? SCGapSize.none : SCGapSize.semiSmall,
                      right: index == widget.buttons.length - 1 ? SCGapSize.none : SCGapSize.semiSmall
                    ),
                    child: SCDialogButtonWidget(
                      onPressed: () => _onPressed(isLoadingMap, index),
                      title: widget.buttons[index].title,
                      isPrimary: widget.buttons[index].isPrimary,
                      isLoading: isLoadingMap[index]!,
                      isEnabled: _isEnabled(isLoadingMap)
                    )
                  )
                ))
              )
            ]
          )
        )
      )
    );
  }

  bool _isEnabled(Map<int, bool> isLoadingMap) {
    for (bool value in isLoadingMap.values) {
      if (value) return false;
    }

    return true;
  }

  Future<void> _onPressed(Map<int, bool> isLoadingMap, int index) async {
    if (widget.buttons[index].onPressed == null) {
      return Navigator.pop(context);
    }

    if (_isFuture(index)) {
      ref.read(isLoadingProvider.notifier).update((state) => state = Map.of(state)..update(index, (bool value) => true));
    }

    bool success = await widget.buttons[index].onPressed!;

    if (success && context.mounted) {
      return Navigator.pop(context);
    }

    if (_isFuture(index)) {
      ref.read(isLoadingProvider.notifier).update((state) => state = Map.of(state)..update(index, (bool value) => false));
    }
  }

  bool _isFuture(int index) => widget.buttons[index].onPressed!.runtimeType is! Future;
}