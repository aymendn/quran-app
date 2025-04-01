import 'package:flutter/material.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';

enum LoadingType {
  normal,
  withTextRow,
  withTextColumn,
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    this.size,
    this.color,
    this.strokeWidth,
    this.type = LoadingType.normal,
    this.text,
    this.textColor,
  });

  final double? size;
  final Color? color;
  final double? strokeWidth;
  final LoadingType type;
  final String? text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final loading = SizedBox(
      width: size ?? 20.rm,
      height: size ?? 20.rm,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth ?? 2,
      ),
    );

    final textWidget = Text(
      text ?? 'Please wait...',
      style: context.textTheme.bodySmall?.copyWith(
        color: textColor ?? context.colors.textPrimary,
      ),
    );

    if (type == LoadingType.withTextRow) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          loading,
          10.gapW,
          textWidget,
        ],
      );
    }

    if (type == LoadingType.withTextColumn) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loading,
          10.gapH,
          textWidget,
        ],
      );
    }

    return loading;
  }

  factory CustomLoading.withTextRow({
    double? size,
    Color? color,
    Color? textColor,
    double? strokeWidth,
    String? text,
  }) {
    return CustomLoading(
      size: size,
      color: color,
      strokeWidth: strokeWidth,
      type: LoadingType.withTextRow,
      text: text,
      textColor: textColor,
    );
  }

  factory CustomLoading.withTextColumn({
    double? size,
    Color? color,
    Color? textColor,
    double? strokeWidth,
    String? text,
  }) {
    return CustomLoading(
      size: size,
      color: color,
      strokeWidth: strokeWidth,
      type: LoadingType.withTextColumn,
      text: text,
      textColor: textColor,
    );
  }
}
