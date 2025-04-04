import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/utils/io.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseModel extends Equatable {
  final String fileName;
  final Database database;

  const DatabaseModel(this.fileName, this.database);

  String get fullPath => getFullPath(fileName);

  static String getFullPath(String fileName) {
    return IO.joinPaths(
      IO.supportFolderPath, // this is the path to the app's support folder
      'tafsir', // the folder where the db is stored
      '$fileName.db', // the name of the file + db
    );
  }

  static Future<DatabaseModel> fromFileName(String fileName) async {
    final fullPath = getFullPath(fileName);
    logger.fine('Opening database: $fullPath');
    final db = await openDatabase(fullPath, readOnly: true);
    return DatabaseModel(fileName, db);
  }

  @override
  List<Object?> get props => [fileName];
}

abstract class QuranDBService {
  static List<DatabaseModel> databases = [];
  static Database? _quranDB;

  static Future<Database> getDatabase(String fileName) async {
    for (final db in databases) {
      if (db.fileName == fileName) {
        return db.database;
      }
    }

    final db = await DatabaseModel.fromFileName(fileName);
    databases.add(db);
    return db.database;
  }

  static final String quranDBAssetPath = join('assets', 'db', 'quran.db');
  static final String quranDBPath = join(IO.supportFolderPath, 'quran.db');

  static Future<Database> getQuranDB() async {
    if (_quranDB != null) {
      return _quranDB!;
    }

    // if file is not in `quranDBPath`, then copy it from `quranDBAssetPath`
    final file = File(quranDBPath);
    if (!file.existsSync()) {
      // Load the DB from assets.
      final data = await rootBundle.load(quranDBAssetPath);
      final bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Create the file in the app's support folder.
      await file.writeAsBytes(bytes, flush: true);
    }

    _quranDB = await openDatabase(quranDBPath, readOnly: true);
    return _quranDB!;
  }
}
