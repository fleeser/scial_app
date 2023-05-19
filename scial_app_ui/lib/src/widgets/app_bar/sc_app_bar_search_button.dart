import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCAppBarSearchButton extends ConsumerStatefulWidget {

  const SCAppBarSearchButton({ 
    super.key,
    required this.isExpandedProvider
  });

  final AutoDisposeStateProvider<bool> isExpandedProvider;

  @override
  ConsumerState<SCAppBarSearchButton> createState() => _SCAppBarSearchButtonState();
}

class _SCAppBarSearchButtonState extends ConsumerState<SCAppBarSearchButton> with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375)
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);

    final isExpanded = ref.watch(widget.isExpandedProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 375),
      height: kToolbarHeight - 10.0,
      width: isExpanded
        ? MediaQuery.of(context).size.width - 2.0 * SCGapSize.semiBig.getSpacing(theme)
        : kToolbarHeight - 10.0,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: theme.colors.appBarButtonBackground,
        borderRadius: BorderRadius.circular((kToolbarHeight - 10.0) / 2.0)
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 375),
            top: 6.0,
            right: 6.0,
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: isExpanded 
                ? 1.0 
                : 0.0,
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                height: (kToolbarHeight - 10.0) - 12.0,
                width: (kToolbarHeight - 10.0) - 12.0,
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(((kToolbarHeight - 10.0) - 12.0) / 2.0)),
                  child: AnimatedBuilder(
                    animation: animationController,
                    child: const SCIcon(
                      icon: SCIcons.x, 
                      size: ((kToolbarHeight - 10.0) - 12.0) / 2.0, 
                      color: Colors.greenAccent // TODO color
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: animationController.value * 2.0 * pi,
                        child: child
                      );
                    }
                  )
                )
              )
            )
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 375),
            left: kToolbarHeight - 10.0,
            right: kToolbarHeight - 10.0 - 6.0,
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isExpanded 
                ? 1.0 
                : 0.0,
              child: const SizedBox(
                height: kToolbarHeight - 10.0,
                width: 180.0,
                // TODO: light or dark style keyboard
                child: TextField(
                  maxLines: 1,
                  cursorColor: Colors.red, // TODO: color
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
                    hintMaxLines: 1,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'search_hint_text',
                    labelStyle: TextStyle(
                      color: Colors.blue, // TODO: color
                      fontFamily: 'Poppins',
                      fontSize: 16.0
                    ),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                  style: TextStyle(
                    color: Colors.pink, // TODO: color
                    fontFamily: 'Poppins',
                    fontSize: 16.0
                  )
                )
              )
            )
          ),
          SizedBox(
            width: kToolbarHeight - 10.0,
            height: kToolbarHeight - 10.0,
            child: RawMaterialButton(
              onPressed: () {
                if (isExpanded) {
                  animationController.reverse();
                  FocusManager.instance.primaryFocus?.unfocus();
                } else {
                  animationController.forward();
                }

                ref.read(widget.isExpandedProvider.notifier).update((state) => state = !state);
              },
              elevation: 0.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((kToolbarHeight - 10.0) / 2.0)),
              fillColor: Colors.purple,// TODO color
              child: const SCIcon(
                icon: SCIcons.search,
                size: (kToolbarHeight - 10.0) / 2.0,
                color: Colors.orange // TODO color
              )
            )
          )
        ]
      )
    );
  }
}