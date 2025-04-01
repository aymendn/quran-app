import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/home/presentation/home_controller.dart';
import 'package:quran_app/features/home/presentation/widgets/animated_show_hide.dart';

class MenuWrapper extends ConsumerWidget {
  const MenuWrapper({
    super.key,
    required this.child,
    required this.direction,
  });

  final Widget child;
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShow =
        ref.watch(homeControllerProvider.select((c) => c.isShowMenu));
    return AnimatedShowHide(
      direction: direction,
      isShow: isShow,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: const Color.fromARGB(245, 33, 31, 31),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: context.isDark
                ? const Color.fromARGB(140, 233, 225, 225)
                : Colors.transparent,
            width: 1.r,
          ),
        ),
        child: child,
      ),
    );
  }
}
