import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/common_widgets/async_value_builder.dart';
import 'package:quran_app/features/home/data/quran_repository.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';
import 'package:quran_app/features/tafsir/presentation/single_tafsir_section.dart';
import 'package:quran_app/features/tafsir/presentation/tafsir_empty_section.dart';

final tafsirFutureProvider = FutureProvider.autoDispose
    .family<List<TafsirModel>, int>((ref, index) async {
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
        AsyncValueBuilder(
          value: ref.watch(tafsirFutureProvider(index)),
          onRefresh: () => ref.refresh(tafsirFutureProvider(index)),
          data: (tafsirList) {
            if (tafsirList.isEmpty) {
              return TafsirEmptySection(index: index);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final tafsir in tafsirList) SingleTafsirSection(tafsir),
              ],
            );
          },
        ),
      ],
    );
  }
}
