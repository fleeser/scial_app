import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_back_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_image.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_search_button.dart';
import 'package:scial_app_ui/src/widgets/app_bar/sc_app_bar_title.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_padding.dart';

class SCAppBar extends ConsumerWidget implements PreferredSizeWidget {

  const SCAppBar({
    super.key,
    required this.context,
    this.title,
    this.image,
    this.backButton,
    this.actionButtons = const <SCAppBarButton>[],
    this.searchButton
  });

  final BuildContext context;
  final SCAppBarTitle? title;
  final SCAppBarImage? image;
  final SCAppBarBackButton? backButton;
  final List<SCAppBarButton> actionButtons;
  final SCAppBarSearchButton? searchButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final SCThemeData theme = SCTheme.of(context);

    final bool searchIsExpanded = searchButton != null
      ? ref.watch(searchButton!.isExpandedProvider)
      : false;

    return Container(
      width: preferredSize.width,
      height: preferredSize.height,
      color: theme.colors.appBarBackground,
      padding: EdgeInsets.only(
        left: SCGapSize.semiBig.getSpacing(theme),
        right: SCGapSize.semiBig.getSpacing(theme),
        top: MediaQuery.of(context).padding.top
      ),
      child: Row(
        children: [
          if (backButton != null) SCAnimatedVisibilityWidget(
            isVisible: !searchIsExpanded,
            child: SCPadding(
              padding: const SCEdgeInsets.only(right: SCGapSize.semiBig),
              child: backButton
            )
          ),
          Expanded(
            child: SCAnimatedVisibilityWidget(
              isVisible: !searchIsExpanded,
              child: Row(
                children: [
                  if (image != null) image!,
                  if (image != null && title != null) const SCGap.regular(),
                  if (title != null) Expanded(child: title!)
                ]
              )
            )
          ),
          ...List.generate(actionButtons.length + (searchButton != null ? 1 : 0), (int index) => searchButton != null && index == actionButtons.length
            ? SCPadding(
              padding: SCEdgeInsets.only(
                left: searchIsExpanded ? SCGapSize.none : index == 0
                  ? SCGapSize.semiBig
                  : SCGapSize.regular
              ),
              child: searchButton
            )
            : SCAnimatedVisibilityWidget(
              isVisible: !searchIsExpanded, 
              child: SCPadding(
                padding: SCEdgeInsets.only(
                  left: index == 0
                    ? SCGapSize.semiBig
                    : SCGapSize.regular
                ),
                child: actionButtons[index]
              )
            )
          )
        ]
      )
    );
  }
  
  @override
  Size get preferredSize => Size(double.maxFinite, MediaQuery.of(context).padding.top + kToolbarHeight);
}

class SCAnimatedVisibilityWidget extends StatefulWidget {

  const SCAnimatedVisibilityWidget({
    super.key,
    required this.isVisible,
    required this.child
  });

  final bool isVisible;
  final Widget child;

  @override
  State<SCAnimatedVisibilityWidget> createState() => _SCAnimatedVisibilityWidgetState();
}

class _SCAnimatedVisibilityWidgetState extends State<SCAnimatedVisibilityWidget> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 375), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void didUpdateWidget(SCAnimatedVisibilityWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Visibility(
          visible: widget.isVisible && _animation.status == AnimationStatus.dismissed,
          child: child!
        );
      },
      child: widget.child
    );
  }
}