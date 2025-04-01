import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets/fonts.gen.dart';
import 'package:quran_app/common_widgets/async_value_builder.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/home/data/quran_repository.dart';
import 'package:quran_app/i18n/strings.g.dart';

final tafsirFutureProvider =
    FutureProvider.autoDispose.family<String, int>((ref, index) async {
  final tafsir =
      await ref.watch(quranRepositoryProvider).getTafirFromIndex(index);
  return tafsir;
});

class TafsirSection extends ConsumerWidget {
  const TafsirSection({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.t.tafsir,
          style: context.textTheme.labelSmall,
        ),
        6.gapH,
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.wm, vertical: 10.hm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.colorScheme.primaryContainer.withOpacity(.2),
            border: Border.all(
              color: context.colorScheme.onSurface.withOpacity(.1),
              width: 1,
            ),
          ),
          child: AsyncValueBuilder(
            value: ref.watch(tafsirFutureProvider(index)),
            onRefresh: () => ref.refresh(tafsirFutureProvider(index)),
            data: (tafsir) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  tafsir,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontFamily: FontFamily.uthmanTN,
                    height: 1.5.spMin,
                    fontSize: 19.spMin,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
