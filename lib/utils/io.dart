import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/enums/riwaya_enum.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';

abstract class IO {
  static late String supportFolderPath;

  static Future<void> init() async {
    supportFolderPath = (await getApplicationSupportDirectory()).path;
  }

  static String joinPaths(
    String part1, [
    String? part2,
    String? part3,
    String? part4,
    String? part5,
    String? part6,
    String? part7,
    String? part8,
    String? part9,
    String? part10,
    String? part11,
    String? part12,
    String? part13,
    String? part14,
    String? part15,
    String? part16,
  ]) {
    return join(part1, part2, part3, part4, part5, part6, part7, part8, part9,
        part10, part11, part12, part13, part14, part15, part16);
  }

  static String getPageName(int pageNumber) {
    return '$pageNumber.jpg';
  }

  static String getPageLocalPath(int pageNumber) {
    return join(supportFolderPath, 'riwayah',
        SharedPreferencesService.getRiwayah(), getPageName(pageNumber));
  }

  static String getQuranDBPath(RiwayaEnum riwaya) {
    return join(
        supportFolderPath, 'quran_text', 'quran_${riwaya.quranTextDBName}.db');
  }

  // static String _pad(int number) {
  //   if (number < 10) {
  //     return '00$number';
  //   } else if (number < 100) {
  //     return '0$number';
  //   } else {
  //     return number.toString();
  //   }
  // }

  static Future<void> unzipRiwayah(String fileName) async {
    final inputFilePath = join(supportFolderPath, 'riwayah', '$fileName.zip');
    final outputDirectoryPath = join(supportFolderPath, 'riwayah');
    await extractFileToDisk(inputFilePath, outputDirectoryPath);

    // remove the zip file after extraction
    await File(inputFilePath).delete();
  }

  static Future<void> unzipTafsir(String fileName) async {
    final inputFilePath = join(supportFolderPath, 'tafsir', '$fileName.zip');
    final outputDirectoryPath = join(supportFolderPath, 'tafsir');
    await extractFileToDisk(inputFilePath, outputDirectoryPath);

    // remove the zip file after extraction
    await File(inputFilePath).delete();
  }

  static Future<void> removeTafsir(String fileName) async {
    final inputFilePath = join(supportFolderPath, 'tafsir', '$fileName.db');
    final file = File(inputFilePath);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
