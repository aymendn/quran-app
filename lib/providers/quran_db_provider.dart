import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:path/path.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/utils/io.dart';
import 'package:sqflite/sqflite.dart';

abstract class QuranDBService {
  static late Database _quranHafsDB;
  static late Database _quranWarshDB;
  static late Database _tafsirDB;
  static late Database _versePositionDB;

  static Database get quranHafsDB => _quranHafsDB;
  static Database get quranWarshDB => _quranWarshDB;
  static Database get tafsirDB => _tafsirDB;
  static Database get versePositionDB => _versePositionDB;

  static final String zipFilePath = join('assets', 'db', 'db.zip');
  static final String dbFolderPath = join(IO.supportFolderPath, 'db');
  static final String zipFileMovedPath = join(dbFolderPath, 'db.zip');
  static final String tafsirDBPath = join(dbFolderPath, 'tafaseer.db');
  static final String versePositionDBPath =
      join(dbFolderPath, 'verse_position_warsh.db');
  static final String quranHafsDBPath = join(dbFolderPath, 'quran_hafs.db');
  static final String quranWarshDBPath = join(dbFolderPath, 'quran_warsh.db');

  static Future<void> init() async {
    logger.fine('Starting QuranDBService.init()');

    // if db folder does not exist, create it
    final dbFolder = Directory(dbFolderPath);
    if (!dbFolder.existsSync()) {
      dbFolder.createSync();
    }

    logger.fine('Verifying db folder: $dbFolderPath');

    // verify that the db folder contains the db files
    final dbFiles = [
      File(quranHafsDBPath),
      File(quranWarshDBPath),
      File(tafsirDBPath),
      File(versePositionDBPath),
    ];

    if (dbFiles.every((file) => file.existsSync())) {
      // open the db files
      _quranHafsDB = await openDatabase(quranHafsDBPath, readOnly: true);
      _quranWarshDB = await openDatabase(quranWarshDBPath, readOnly: true);
      _tafsirDB = await openDatabase(tafsirDBPath, readOnly: true);
      _versePositionDB =
          await openDatabase(versePositionDBPath, readOnly: true);

      // remove the zip file if it exists
      final zipFile = File(zipFileMovedPath);
      if (zipFile.existsSync()) {
        zipFile.deleteSync();
      }
      return;
    }

    logger.fine('DB files not found, extracting from zip file');

    // extract the db files
    ByteData data = await rootBundle.load(zipFilePath);
    List<int> bytes = data.buffer.asUint8List();

    // // Write the zip file
    final zipFileMoved = File(zipFileMovedPath);
    await zipFileMoved.writeAsBytes(bytes);

    // Extract the zip file
    await ZipFile.extractToDirectory(
      zipFile: zipFileMoved,
      destinationDir: Directory(dbFolderPath),
    );

    logger.fine('DB files extracted to: $dbFolderPath');

    // open the db files
    _quranHafsDB = await openDatabase(quranHafsDBPath, readOnly: true);
    _quranWarshDB = await openDatabase(quranWarshDBPath, readOnly: true);
    _tafsirDB = await openDatabase(tafsirDBPath, readOnly: true);
    _versePositionDB = await openDatabase(versePositionDBPath, readOnly: true);

    // remove the zip file if it exists
    final zipFile = File(zipFileMovedPath);
    if (zipFile.existsSync()) {
      zipFile.deleteSync();
    }
  }
}
