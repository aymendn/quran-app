import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets/fonts.gen.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';

class SingleTafsirSection extends StatelessWidget {
  const SingleTafsirSection(this.tafsir, {super.key});

  final TafsirModel tafsir;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            tafsir.name.displayText(context),
            style: context.textTheme.labelMedium,
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.wm, vertical: 10.hm),
          margin: EdgeInsets.only(bottom: 18.h, top: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.colorScheme.primaryContainer.withOpacity(.2),
            border: Border.all(
              color: context.colorScheme.onSurface.withOpacity(.1),
              width: 1,
            ),
          ),
          child: Text(
            tafsir.tafsir,
            style: context.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              fontSize: 18.spMin,
              fontFamily: FontFamily.uthmanTN,
            ),
          ),
        ),
      ],
    );
  }
}
