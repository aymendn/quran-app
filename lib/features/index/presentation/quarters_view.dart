import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/i18n/strings.g.dart';

class QuartersView extends StatelessWidget {
  const QuartersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 48.h),
        child: Column(
          children: [
            Text(
              context.t.comingSoon,
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            8.gapH,
            Text(
              context.t.comingSoonMessage,
              style: context.textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
