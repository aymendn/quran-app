import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/providers/quran_db_provider.dart';
import 'package:sqflite/sqflite.dart';

final quranLocalDataSourceProvider = Provider<QuranLocalDataSource>((ref) {
  return const QuranLocalDataSource();
});

class QuranLocalDataSource {
  const QuranLocalDataSource();

  Database get _quranDB => QuranDBService.quranHafsDB;
  Database get _tafsirDB => QuranDBService.tafsirDB;

  Future<Map<String, dynamic>> getVerse(int chapter, int verse) async {
    final List<Map<String, dynamic>> results = await _quranDB.query(
      'arabic_text',
      where: 'sura = ? AND ayah = ?',
      whereArgs: [chapter, verse],
      limit: 1,
    );

    return results.firstOrNull ?? {};
  }

  Future<Map<String, dynamic>> getTafir(int chapter, int verse) async {
    final List<Map<String, dynamic>> results = await _tafsirDB.query(
      'Tafseer',
      where: 'tafseer = ? AND sura = ? AND ayah = ?',
      whereArgs: [3, chapter, verse],
      limit: 1,
    );

    return results.firstOrNull ?? {};
  }
}
