import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.customTitle,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.leadingWidth,
    this.centertitle,
    this.titleStyle,
    this.bottom,
  });

  final String? title;
  final Widget? customTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double? leadingWidth;
  final bool? centertitle;
  final TextStyle? titleStyle;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final hasBackButton = parentRoute?.impliesAppBarDismissal ?? false;
    final hasLeading = leading != null || hasBackButton;

    return AppBar(
      backgroundColor: backgroundColor,
      title: customTitle ?? Text(title ?? "", style: titleStyle),
      actions:
          actions == null || actions!.isEmpty ? null : [...actions!, 12.gapW],
      leading: leading,
      centerTitle: centertitle,
      leadingWidth: leadingWidth ?? 60.wm,
      bottom: bottom,
      titleSpacing: hasLeading ? 2.w : 20.w,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
