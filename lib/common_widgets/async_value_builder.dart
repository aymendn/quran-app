import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/common_widgets/custom_button.dart';
import 'package:quran_app/common_widgets/custom_loading.dart';
import 'package:quran_app/exceptions/app_exception.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    super.key,
    required this.value,
    required this.data,
    this.fakeValue,
    this.error,
    this.loading,
    this.foregroundColor,
    this.backgroundColor,
    this.onRefresh,
    this.showLoadingOnError = false,
    this.skeletonizerIgnorePointers = true,
    this.loadingOpacity = 0.2,
  });

  final AsyncValue<T> value;
  final T? fakeValue;
  final Widget Function(T value) data;
  final Widget Function(AppException e)? error;
  final Widget Function()? loading;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onRefresh;
  final bool showLoadingOnError;
  final bool skeletonizerIgnorePointers;
  final double loadingOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: 240.milliseconds,
      curve: Curves.easeInOut,
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      child: value.when(
        data: data,
        loading: loadingBuilder,
        error: (e, st) => errorBuilder(
          AppException.fromDartException(e),
          st,
          context,
        ),
      ),
    );
  }

  Widget loadingBuilder() {
    if (fakeValue != null) {
      return Skeletonizer(
        ignorePointers: skeletonizerIgnorePointers,
        child: data(fakeValue! as T),
      );
    }

    if (loading != null) {
      return loading!();
    }

    return Center(
      child: CustomLoading(
        size: 30.rm,
        strokeWidth: 3,
        color: foregroundColor,
      ),
    );
  }

  Widget errorBuilder(AppException e, StackTrace st, BuildContext context) {
    final appException = AppException.fromDartException(e, st);

    final errorWidget = error?.call(appException) ??
        DottedBorder(
          color:
              (foregroundColor ?? context.colors.textPrimary).withOpacity(.3),
          strokeWidth: 1,
          radius: const Radius.circular(8),
          borderType: BorderType.RRect,
          padding: EdgeInsets.all(20.rm),
          dashPattern: [2.r, 2.r],
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  appException.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (foregroundColor ?? context.colors.textPrimary)
                        .withOpacity(0.9),
                  ),
                ),
                10.gapH,
                if (onRefresh != null)
                  CustomButton(
                    foregroundColor: context.colors.textPrimary,
                    backgroundColor: Colors.transparent,
                    strokeColor: context.colors.textPrimary.withOpacity(.3),
                    icon: Symbols.refresh,
                    onPressed: onRefresh,
                    text: context.t.retry,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.rm,
                      vertical: 10.rm,
                    ),
                    rowMainAxisSize: MainAxisSize.min,
                  ),
              ],
            ),
          ),
        );

    if (showLoadingOnError) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: loadingOpacity,
            child: loadingBuilder(),
          ),
          errorWidget,
        ],
      );
    }

    return errorWidget;
  }
}
