import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/features/home/data/quran_local_data_source.dart';
import 'package:quran_app/features/home/domain/verse_model.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';
import 'package:quran_app/utils/quran_utils.dart';
import 'package:riverpod/riverpod.dart';

final quranRepositoryProvider = Provider<QuranRepository>((ref) {
  return QuranRepository(ref.watch(quranLocalDataSourceProvider));
});

class QuranRepository {
  final QuranLocalDataSource _dataSource;

  QuranRepository(this._dataSource);

  Future<Verse> getVerse(int chapter, int verse) async {
    final verseData = await _dataSource.getVerse(chapter, verse);
    return Verse.fromJson(verseData);
  }

  Future<List<TafsirModel>> getTafir(int chapter, int verse) async {
    try {
      final tafsirData = await _dataSource.getTafir(chapter, verse);
      return tafsirData;
    } catch (e, st) {
      logger.fine('error: $e');
      logger.fine(st);
      rethrow;
    }
  }

  Future<Verse> getVerseFromIndex(int index) async {
    try {
      final (chapter, verse) = QuranUtils.indexToChapterVerse(index + 1);
      final verseData = await _dataSource.getVerse(chapter, verse);
      return Verse.fromJson(verseData);
    } catch (e, st) {
      logger.fine('error: $e');
      logger.fine(st);
      rethrow;
    }
  }

  Future<List<TafsirModel>> getTafirFromIndex(int index) async {
    try {
      final (chapter, verse) = QuranUtils.indexToChapterVerse(index + 1);
      final tafsirData = await _dataSource.getTafir(chapter, verse);
      return tafsirData;
    } catch (e, st) {
      logger.fine('error55: $e');
      logger.fine(st);
      rethrow;
    }
  }
}
