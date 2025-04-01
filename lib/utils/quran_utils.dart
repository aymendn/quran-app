import 'package:quran_app/features/home/data/quran_data.dart';

abstract class QuranUtils {
  static (int, int) indexToChapterVerse(int index) {
    final chapterLengths =
        QuranData.chapters.map((c) => c.numberOfAyahs).toList();

    int chapter = 1;
    int verse = index;

    while (verse > chapterLengths[chapter - 1]) {
      verse -= chapterLengths[chapter - 1];
      chapter++;
    }

    return (chapter, verse);
  }

  static int chapterVerseToIndex(int chapter, int verse) {
    final chapterLengths =
        QuranData.chapters.map((c) => c.numberOfAyahs).toList();

    int index = 0;
    for (int i = 1; i < chapter; i++) {
      index += chapterLengths[i - 1];
    }

    index += verse;

    return index;
  }

  /// returns index of the first verse in the page
  static int firstVerseInPage(int page) {
    final chapterVerse = QuranData.pageChapterVerse[page - 1];
    return chapterVerseToIndex(chapterVerse[0], chapterVerse[1] - 1);
  }
}
