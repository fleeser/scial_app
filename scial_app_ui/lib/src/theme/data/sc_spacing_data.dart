import 'package:flutter/widgets.dart';

class SCSpacingData {

  const SCSpacingData({
    required this.small,
    required this.semiSmall,
    required this.regular,
    required this.semiBig,
    required this.big
  });

  factory SCSpacingData.regular() => const SCSpacingData(
    small: 4.0,
    semiSmall: 8.0,
    regular: 12.0,
    semiBig: 22.0,
    big: 32.0
  );

  final double small;
  final double semiSmall;
  final double regular;
  final double semiBig;
  final double big;

  SCEdgeInsetsSpacingData asInsets() => SCEdgeInsetsSpacingData(this);
}

class SCEdgeInsetsSpacingData {

  const SCEdgeInsetsSpacingData(this._spacing);

  EdgeInsets get small => EdgeInsets.all(_spacing.small);
  EdgeInsets get semiSmall => EdgeInsets.all(_spacing.semiSmall);
  EdgeInsets get regular => EdgeInsets.all(_spacing.regular);
  EdgeInsets get semiBig => EdgeInsets.all(_spacing.semiBig);
  EdgeInsets get big => EdgeInsets.all(_spacing.big);

  final SCSpacingData _spacing;
}