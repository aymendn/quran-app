import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/tafsir/presentation/tafsir_bottom_sheet_app_bar.dart';
import 'package:quran_app/features/tafsir/presentation/tafsir_bottom_sheet_bottom_bar.dart';
import 'package:quran_app/features/tafsir/presentation/tafsir_content.dart';

final scrollControllerProvider = Provider<ScrollController>((ref) {
  return ScrollController();
});

class TafsirBottomSheet extends ConsumerWidget {
  const TafsirBottomSheet({
    super.key,
    required this.scrollController,
    required this.bottomSheetOffset,
  });

  final ScrollController scrollController;
  final double bottomSheetOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacity = (bottomSheetOffset * 1.5).clamp(0.0, 1.0);

    return Column(
      children: [
        Container(
          height: 56.hm,
          constraints: BoxConstraints(maxHeight: 80.hm * bottomSheetOffset),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            border: Border(
              bottom: BorderSide(
                color: context.theme.colorScheme.onSurface.withOpacity(.1),
              ),
            ),
          ),
          child: Opacity(
            opacity: opacity,
            child: const TafsirBottomSheetAppBar(),
          ),
        ),
        ProviderScope(
          overrides: [
            scrollControllerProvider.overrideWithValue(scrollController),
          ],
          child: const TafsirContent(),
        ),
        Container(
          height: 56.hm,
          constraints: BoxConstraints(maxHeight: 80.hm * bottomSheetOffset),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            border: Border(
              top: BorderSide(
                color: context.theme.colorScheme.onSurface.withOpacity(.1),
              ),
            ),
          ),
          child: Opacity(
            opacity: opacity,
            child: const TafsirBottomSheetBottomBar(),
          ),
        ),
      ],
    );
  }
}
