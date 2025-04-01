import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/home/data/quran_data.dart';
import 'package:quran_app/features/home/domain/chapter_model.dart';
import 'package:quran_app/features/home/presentation/home_controller.dart';
import 'package:quran_app/utils/quran_utils.dart';

final tafsirControllerProvider =
    StateNotifierProvider.autoDispose<TafsirController, TafsirState>((ref) {
  final currentPage = ref.watch(currentPageProvider);
  final startingIndex = QuranUtils.firstVerseInPage(currentPage);
  return TafsirController(startingIndex);
});

class TafsirController extends StateNotifier<TafsirState> {
  TafsirController(this.startingIndex) : super(TafsirState(startingIndex)) {
    pageController = PageController(initialPage: state.index);
  }

  final int startingIndex;
  late final PageController pageController;

  void onPageChanged(int index) {
    state = TafsirState(index);
  }

  void next() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previous() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class TafsirState {
  final int index;

  TafsirState(this.index);

  (int, int) get chapterVerse {
    return QuranUtils.indexToChapterVerse(index + 1);
  }

  int get chapterNumber {
    return chapterVerse.$1;
  }

  ChapterModel get chapter {
    return QuranData.chapters[chapterNumber - 1];
  }

  int get verseNumber {
    return chapterVerse.$2;
  }
}
