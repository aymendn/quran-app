import 'package:carousel_slider/carousel_controller.dart' as carousel;
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../quran/quran.dart';
import '../quran/page_data.dart';

class Quran extends ChangeNotifier {
  late int currentPage;
  final SharedPreferences prefs;
  final carousel.CarouselSliderController carouselController =
      carousel.CarouselSliderController();

  Quran(this.prefs) {
    currentPage = prefs.getInt('page') ?? 1;
  }

  int get surahNumber => quranPages[currentPage - 1].surah;

  String get surahName => getSurahNameArabic(surahNumber);

  int get juz => quranPages[currentPage - 1].juz;

  int get hizb => quranPages[currentPage - 1].hizb;

  int get hizbQuarter => quranPages[currentPage - 1].hizbQuarter;

  bool get isRightPage => currentPage % 2 != 0;

  String get hizbText => gethizbText(currentPage);

  String get surahData => getSurahDataWithName(surahNumber);

  void goToPage(int pageIndex) {
    if (pageIndex < 0 || pageIndex >= quranPages.length) {
      // Handle invalid pageIndex
      return;
    }
    carouselController.jumpToPage(pageIndex);
  }

  void changePage(int newIndex) {
    if (newIndex < 0 || newIndex >= quranPages.length) {
      // Handle invalid newIndex
      return;
    }
    currentPage = newIndex + 1;
    notifyListeners();
    prefs.setInt('page', currentPage);
  }
}
