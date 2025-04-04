import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';
import 'package:quran_app/providers/quran_db_provider.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';
import 'package:sqflite/sqflite.dart';

final quranLocalDataSourceProvider = Provider<QuranLocalDataSource>((ref) {
  return const QuranLocalDataSource();
});

class QuranLocalDataSource {
  const QuranLocalDataSource();

  Future<Map<String, dynamic>> getVerse(int chapter, int verse) async {
    final Database quranDB = await QuranDBService.getQuranDB();
    final List<Map<String, dynamic>> results = await quranDB.query(
      'arabic_text',
      where: 'sura = ? AND ayah = ?',
      whereArgs: [chapter, verse],
      limit: 1,
    );

    return results.firstOrNull ?? {};
  }

  Future<List<TafsirModel>> getTafir(int chapter, int verse) async {
    List<TafsirModel> result = [];

    final tafsirList = SharedPreferencesService.getTafsirList();
    final tafsirDBs = [
      for (final tafsir in tafsirList)
        await QuranDBService.getDatabase(tafsir.fileName),
    ];

    for (var i = 0; i < tafsirList.length; i++) {
      final tafsir = tafsirList[i];
      final tafsirDB = tafsirDBs[i];
      final List<Map<String, dynamic>> results = await tafsirDB.query(
        'verses',
        where: 'sura = ? AND ayah = ?',
        whereArgs: [chapter, verse],
        limit: 1,
      );

      final tafsirData = results.firstOrNull ?? {};
      final String tafsirText =
          tafsirData.containsKey('text') ? tafsirData['text'] : '';

      result.add(tafsir.copyWith(tafsir: tafsirText));
    }

    return result;
  }
}
