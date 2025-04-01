import 'package:flutter/material.dart';

class InvertColor extends StatelessWidget {
  const InvertColor({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isInvert = Theme.of(context).brightness == Brightness.dark;

    if (!isInvert) return child;

    final colorMatrix = <double>[
      -1, 0, 0, 0, 255, // Red
      0, -1, 0, 0, 255, // Green
      0, 0, -1, 0, 255, // Blue
      0, 0, 0, 1.2, 0, // Alpha
    ];

    return ColorFiltered(
      colorFilter: ColorFilter.matrix(colorMatrix),
      child: child,
    );
  }
}
