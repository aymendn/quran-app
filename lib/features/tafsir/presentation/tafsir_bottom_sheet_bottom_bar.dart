import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/features/tafsir/presentation/tafsir_controller.dart';

class TafsirBottomSheetBottomBar extends ConsumerWidget {
  const TafsirBottomSheetBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tafsir = ref.watch(tafsirControllerProvider);
    final notifier = ref.read(tafsirControllerProvider.notifier);

    return Row(
      textDirection: TextDirection.rtl,
      children: [
        IconButton(
          icon: Icon(
            Symbols.arrow_forward_ios,
            size: 20.spMin,
            weight: 300,
          ),
          padding: EdgeInsets.all(14.r),
          onPressed: notifier.previous,
        ),
        Expanded(
          child: Text(
            '${tafsir.chapter.name(context)} : ${tafsir.verseNumber}',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: Icon(
            Symbols.arrow_back_ios_new,
            size: 20.spMin,
            weight: 300,
          ),
          padding: EdgeInsets.all(14.r),
          onPressed: notifier.next,
        ),
      ],
    );
  }
}
