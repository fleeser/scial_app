import 'package:flutter/widgets.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';
import 'package:scial_app_ui/src/widgets/responsive/sc_gap.dart';

class SCEdgeInsets {

  const SCEdgeInsets.all(SCGapSize value)
    : left = value,
      top = value,
      right = value,
      bottom = value;

  const SCEdgeInsets.symmetric({
    SCGapSize vertical = SCGapSize.none,
    SCGapSize horizontal = SCGapSize.none
  }) 
  : left = horizontal,
    top = vertical,
    right = horizontal,
    bottom = vertical;

  const SCEdgeInsets.only({
    this.left = SCGapSize.none,
    this.top = SCGapSize.none,
    this.right = SCGapSize.none,
    this.bottom = SCGapSize.none
  });

  const SCEdgeInsets.small({
    this.left = SCGapSize.small,
    this.top = SCGapSize.small,
    this.right = SCGapSize.small,
    this.bottom = SCGapSize.small
  });

  const SCEdgeInsets.semiSmall({
    this.left = SCGapSize.semiSmall,
    this.top = SCGapSize.semiSmall,
    this.right = SCGapSize.semiSmall,
    this.bottom = SCGapSize.semiSmall
  });

  const SCEdgeInsets.regular({
    this.left = SCGapSize.regular,
    this.top = SCGapSize.regular,
    this.right = SCGapSize.regular,
    this.bottom = SCGapSize.regular
  });

  const SCEdgeInsets.semiBig({
    this.left = SCGapSize.semiBig,
    this.top = SCGapSize.semiBig,
    this.right = SCGapSize.semiBig,
    this.bottom = SCGapSize.semiBig
  });

  const SCEdgeInsets.big({
    this.left = SCGapSize.big,
    this.top = SCGapSize.big,
    this.right = SCGapSize.big,
    this.bottom = SCGapSize.big
  });

  final SCGapSize left;
  final SCGapSize top;
  final SCGapSize right;
  final SCGapSize bottom;

  EdgeInsets toEdgeInsets(SCThemeData theme) {
    return EdgeInsets.only(
      left: left.getSpacing(theme),
      top: top.getSpacing(theme),
      right: right.getSpacing(theme),
      bottom: bottom.getSpacing(theme)
    );
  }
}

class SCPadding extends StatelessWidget {

  const SCPadding({
    super.key,
    this.padding = const SCEdgeInsets.all(SCGapSize.none),
    this.child
  });

  const SCPadding.small({
    super.key,
    this.padding = const SCEdgeInsets.all(SCGapSize.none),
    this.child
  });

  const SCPadding.semiSmall({
    super.key,
    this.padding = const SCEdgeInsets.all(SCGapSize.semiSmall),
    this.child
  });

  const SCPadding.regular({
    super.key,
    this.padding = const SCEdgeInsets.all(SCGapSize.regular),
    this.child
  });

  const SCPadding.semiBig({
    super.key,
    this.padding = const SCEdgeInsets.all(SCGapSize.semiBig),
    this.child
  });

  const SCPadding.big({
    super.key,
    this.padding = const SCEdgeInsets.all(SCGapSize.big),
    this.child
  });

  final SCEdgeInsets padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final SCThemeData theme = SCTheme.of(context);
    return Padding(
      padding: padding.toEdgeInsets(theme),
      child: child
    );
  }
}