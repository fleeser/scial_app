import 'package:flutter/material.dart';

class SCCircularProgressIndicator extends StatelessWidget {

  const SCCircularProgressIndicator({
    super.key,
    required this.color,
    required this.size
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(color))
    );
  }
}