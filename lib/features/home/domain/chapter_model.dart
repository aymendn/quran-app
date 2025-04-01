import 'package:flutter/material.dart';
import 'package:quran_app/enums/revelation_enum.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/i18n/strings.g.dart';

class ChapterModel {
  final int id;
  final String englishName;
  final String arabicName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;
  final List<int> pages;
  final int revelationOrder;
  final int chapterNumber;

  ChapterModel({
    required this.id,
    required this.englishName,
    required this.arabicName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.pages,
    required this.revelationOrder,
    required this.chapterNumber,
  });

  int get firstPage => pages.first;

  String name(BuildContext context) {
    if (context.isArabic) {
      return arabicName;
    } else {
      return englishName;
    }
  }

  RevelationEnum get revelationEnum {
    return RevelationEnum.fromArabicString(revelationType);
  }

  String dataFormatted(BuildContext context) {
    return '${context.t.page} $firstPage - ${revelationEnum.text(context)} - ${context.t.verseCount(n: numberOfAyahs)}';
  }

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      englishName: json['name_complex'],
      arabicName: json['name_arabic'],
      englishNameTranslation: json['translated_name']['name'],
      numberOfAyahs: json['verses_count'],
      revelationType: json['revelation_place'],
      pages: json['pages'],
      revelationOrder: json['revelation_order'],
      chapterNumber: json['chapter_number'],
    );
  }
}
