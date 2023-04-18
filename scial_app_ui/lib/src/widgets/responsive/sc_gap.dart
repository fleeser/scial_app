import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

enum SCGapSize {
  none,
  small,
  semiSmall,
  regular,
  semiBig,
  big
}

extension SCGapSizeExtension on SCGapSize {
  
  double getSpacing(SCThemeData theme) {
    switch (this) {
      case SCGapSize.none:
        return 0;
      case SCGapSize.small:
        return theme.spacing.small;
      case SCGapSize.semiSmall:
        return theme.spacing.semiSmall;
      case SCGapSize.regular:
        return theme.spacing.regular;
      case SCGapSize.semiBig:
        return theme.spacing.semiBig;
      case SCGapSize.big:
        return theme.spacing.big;
    }
  }
}

class AppGap extends StatelessWidget {

  const AppGap.none({
    super.key
  })
  : size = SCGapSize.none;

  const AppGap.small({
    super.key
  })
  : size = SCGapSize.small;

  const AppGap.semiSmall({
    super.key
  })
  : size = SCGapSize.semiSmall;

  const AppGap.regular({
    super.key
  })
  : size = SCGapSize.regular;

  const AppGap.semiBig({
    super.key
  })
  : size = SCGapSize.semiBig;

  const AppGap.big({
    super.key
  })
  : size = SCGapSize.big;

  final SCGapSize size;

  @override
  Widget build(BuildContext context) {
    final SCThemeData theme = SCTheme.of(context);
    return Gap(size.getSpacing(theme));
  }
}