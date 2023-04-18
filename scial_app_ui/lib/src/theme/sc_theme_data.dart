import 'package:scial_app_ui/src/theme/data/sc_colors_data.dart';
import 'package:scial_app_ui/src/theme/data/sc_spacing_data.dart';
import 'package:scial_app_ui/src/theme/data/sc_typography_data.dart';

class SCThemeData {

  const SCThemeData({
    required this.colors,
    required this.typography,
    required this.spacing
  });

  factory SCThemeData.regular() => SCThemeData(
    typography: SCTypographyData.regular(),
    colors: SCColorsData.light(),
    spacing: SCSpacingData.regular()
  );

  final SCColorsData colors;
  final SCTypographyData typography;
  final SCSpacingData spacing;

  SCThemeData withColors(SCColorsData colors) {
    return SCThemeData(
      colors: colors,
      typography: typography,
      spacing: spacing
    );
  }
}