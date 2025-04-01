import 'package:flutter/material.dart';

class AdaptiveAspectRatio extends StatelessWidget {
  const AdaptiveAspectRatio({
    super.key,
    required this.child,
    required this.aspcectRatioRange,
  });

  final Widget child;
  final ({double min, double max}) aspcectRatioRange;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double aspectRatio = constraints.maxWidth / constraints.maxHeight;

        // Clamp the aspect ratio between 1/2 and 1/1
        aspectRatio = aspectRatio.clamp(
          aspcectRatioRange.min,
          aspcectRatioRange.max,
        );

        return AspectRatio(
          aspectRatio: aspectRatio,
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth / aspectRatio,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
