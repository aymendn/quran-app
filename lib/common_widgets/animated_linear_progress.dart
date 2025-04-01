import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';

class AnimatedLinearProgress extends StatelessWidget {
  const AnimatedLinearProgress({
    super.key,
    required this.value,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
    this.duration,
  });

  /// Value between 0 and 1
  final double value;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 6.rm,
      width: width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                height: height ?? 6.rm,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: backgroundColor ?? context.colors.bg,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              AnimatedContainer(
                duration: duration ?? 500.ms,
                height: height ?? 6.rm,
                width: constraints.maxWidth * value,
                decoration: BoxDecoration(
                  color: foregroundColor ?? context.colors.secondary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
