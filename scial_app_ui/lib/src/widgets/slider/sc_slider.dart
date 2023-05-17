import 'package:flutter/material.dart';
import 'package:scial_app_ui/scial_app_ui.dart';

class SCSlider extends StatelessWidget {

  const SCSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.divisions,
    required this.min,
    required this.max
  });

  final double value;
  final void Function(double) onChanged;
  final int? divisions;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {

    SCThemeData theme = SCTheme.of(context);
    
    return SliderTheme(
      data: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
        inactiveTrackColor: theme.colors.inactiveTrackColor,
        activeTrackColor: theme.colors.activeTrackColor,
        thumbColor: theme.colors.thumbColor
      ),
      child: Slider(
        value: value, 
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged
      )
    );
  }
}