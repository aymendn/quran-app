import 'package:flutter/material.dart';
import 'package:quran_app/common_widgets/custom_loading.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/function_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';

enum IconPosition { start, end }

class CustomButton extends StatelessWidget {
  factory CustomButton.outlined({
    Key? key,
    required VoidCallback? onPressed,
    String? text,
    Widget? child,
    IconPosition iconPosition = IconPosition.start,
    IconData? icon,
    Widget? widgetIcon,
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? strokeColor,
    double? strokeWeight,
    double? width,
    double? height,
    MainAxisSize rowMainAxisSize = MainAxisSize.max,
    bool isLoading = false,
    EdgeInsetsGeometry? padding,
  }) {
    return CustomButton(
      key: key,
      onPressed: onPressed,
      text: text,
      iconPosition: iconPosition,
      icon: icon,
      widgetIcon: widgetIcon,
      textStyle: textStyle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      strokeColor: strokeColor,
      strokeWeight: strokeWeight,
      width: width,
      height: height,
      isOutlined: true,
      rowMainAxisSize: rowMainAxisSize,
      isLoading: isLoading,
      padding: padding,
      child: child,
    );
  }

  // text button factory
  factory CustomButton.text({
    required VoidCallback? onPressed,
    required String text,
    IconPosition iconPosition = IconPosition.start,
    IconData? icon,
    Widget? widgetIcon,
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    double? width,
    double? height,
    MainAxisSize rowMainAxisSize = MainAxisSize.max,
    bool isLoading = false,
    EdgeInsetsGeometry? padding,
  }) {
    return CustomButton(
      onPressed: onPressed,
      text: text,
      iconPosition: iconPosition,
      icon: icon,
      widgetIcon: widgetIcon,
      textStyle: textStyle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      width: width,
      height: height,
      isOutlined: true,
      rowMainAxisSize: rowMainAxisSize,
      isLoading: isLoading,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 16.wm, vertical: 10.hm),
      strokeColor: Colors.transparent,
      strokeWeight: 0,
    );
  }
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.iconPosition = IconPosition.start,
    this.icon,
    this.iconSize,
    this.widgetIcon,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.strokeColor,
    this.strokeWeight,
    this.height,
    this.width,
    this.textStyle,
    this.isOutlined = false,
    this.rowMainAxisSize = MainAxisSize.max,
    this.isLoading = false,
    this.padding,
  });

  final IconPosition iconPosition;
  final VoidCallback? onPressed;
  final String? text;
  final IconData? icon;
  final double? iconSize;
  final Widget? widgetIcon;
  final Widget? child;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? strokeColor;
  final double? strokeWeight;
  final double? width;
  final double? height;
  final bool isOutlined;
  final MainAxisSize rowMainAxisSize;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // you either provide one of the following:
    // - child only
    // - text only
    // - text and icon
    // - text and iconWidget

    assert(child != null || text != null);

    final textWidget = text == null ? null : Text(text!);
    final iconWidget =
        widgetIcon ?? (icon == null ? null : Icon(icon, size: iconSize));

    Widget childWidget() {
      // if (isLoading) {
      //   return CustomLoading(
      //     color: context.colors.textPrimary,
      //   );
      // }

      if (child != null) {
        return child!;
      }

      if (iconWidget == null) {
        return textWidget!;
      }

      List<Widget> children = [
        iconWidget,
        8.gapW,
        textWidget!,
      ];

      if (iconPosition == IconPosition.end) {
        children = children.reversed.toList();
      }

      final row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: rowMainAxisSize,
        children: children,
      );

      return row;
    }

    final minimumSize = Size(width ?? 0, height ?? 0);
    final fixedSize =
        height == null || width == null ? null : Size(width!, height!);
    final padding = this.padding ??
        EdgeInsets.symmetric(horizontal: 24.wm, vertical: 14.hm);
    final side = strokeColor == null
        ? null
        : BorderSide(
            color: strokeColor!,
            width: strokeWeight ?? 1,
          );

    Widget button() {
      if (isOutlined) {
        return OutlinedButton(
          onPressed: onPressed?.withVibration,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledForegroundColor: disabledForegroundColor,
            minimumSize: minimumSize,
            fixedSize: fixedSize,
            padding: padding,
            side: side,
            textStyle: textStyle,
          ),
          child: childWidget(),
        );
      } else {
        return FilledButton(
          onPressed: onPressed?.withVibration,
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledForegroundColor: disabledForegroundColor,
            minimumSize: minimumSize,
            fixedSize: fixedSize,
            padding: padding,
            side: side,
            textStyle: textStyle,
          ),
          child: childWidget(),
        );
      }
    }

    if (isLoading) {
      return Stack(
        children: [
          IgnorePointer(
            child: Opacity(
              opacity: 0.4,
              child: button(),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: CustomLoading(
                strokeWidth: 3,
                color: context.colors.primary.withOpacity(0.7),
              ),
            ),
          ),
        ],
      );
    } else {
      return button();
    }
  }
}
