import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets/fonts.gen.dart';
import 'package:quran_app/common_widgets/async_value_builder.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/home/data/quran_repository.dart';
import 'package:quran_app/features/home/domain/verse_model.dart';

final verseFutureProvider =
    FutureProvider.autoDispose.family<Verse, int>((ref, index) async {
  final verse =
      await ref.watch(quranRepositoryProvider).getVerseFromIndex(index);
  return verse;
});

class VerseWidget extends ConsumerWidget {
  const VerseWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueBuilder(
      value: ref.watch(verseFutureProvider(index)),
      onRefresh: () => ref.refresh(verseFutureProvider(index)),
      fakeValue: const Verse(
        sura: 1,
        ayah: 1,
        text: 'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
      ),
      data: (verse) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: verse.text,
                  style: TextStyle(
                    fontSize: 24.spMin,
                    fontFamily: FontFamily.uthmanicHafs,
                  ),
                ),
                TextSpan(
                  text: ' \uFD3F${verse.ayah}\uFD3E',
                  style: TextStyle(
                    fontSize: 20.spMin,
                    fontFamily: FontFamily.uthmanTN,
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
