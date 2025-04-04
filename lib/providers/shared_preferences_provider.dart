import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/utils/helper_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefsEnum {
  isDarkMode,
  pageNumber,
  bookmark,
  locale,
  riwayah,
  tafsirList,
}

final sharedPreferencesProvider = Provider<SharedPreferencesService>((ref) {
  return SharedPreferencesService();
});

class SharedPreferencesService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    // init locale
    final locale = _prefs.getString(PrefsEnum.locale.name) ?? 'ar';
    LocaleSettings.setLocaleRaw(locale);
  }

  // THEME MODE & DARK MODE
  ThemeMode getThemeMode() {
    return getIsDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void setThemeMode(ThemeMode themeMode) {
    setIsDarkMode(themeMode == ThemeMode.dark);
  }

  bool getIsDarkMode() {
    return _prefs.getBool(PrefsEnum.isDarkMode.name) ?? false;
  }

  void setIsDarkMode(bool value) {
    _prefs.setBool(PrefsEnum.isDarkMode.name, value);
  }

  // PAGE NUMBER
  int getPageNumber() {
    return _prefs.getInt(PrefsEnum.pageNumber.name) ?? 1;
  }

  void setPageNumber(int value) {
    _prefs.setInt(PrefsEnum.pageNumber.name, value);
  }

  // BOOKMARK
  int? getBookmark() {
    return _prefs.getInt(PrefsEnum.bookmark.name);
  }

  void setBookmark(int? value) {
    if (value == null) {
      _prefs.remove(PrefsEnum.bookmark.name);
      return;
    }
    _prefs.setInt(PrefsEnum.bookmark.name, value);
  }

  // LOCALE
  String getLocale() {
    return _prefs.getString(PrefsEnum.locale.name) ?? 'ar';
  }

  void setLocale(String value) {
    LocaleSettings.setLocaleRaw(value);
    _prefs.setString(PrefsEnum.locale.name, value);
  }

  // RIWAYAH
  static String? getRiwayah() {
    return _prefs.getString(PrefsEnum.riwayah.name);
  }

  static void setRiwayah(String? value) {
    if (value == null) {
      _prefs.remove(PrefsEnum.riwayah.name);
      return;
    }
    _prefs.setString(PrefsEnum.riwayah.name, value);
  }

  // TAFSIR
  static List<TafsirModel> getTafsirList() {
    final jsonList = _prefs.getStringList(PrefsEnum.tafsirList.name) ?? [];
    if (jsonList.isEmpty) return [];
    logger.fine('here');
    // Convert json to map, then to TafsirModel
    return jsonList
        .map(HelperFunctions.jsonDecodeSafe)
        .where((e) => e.isNotEmpty)
        .map((e) => TafsirModel.fromJson(e))
        .toList();
  }

  static void setTafsirList(List<TafsirModel> value) {
    _prefs.setStringList(
      PrefsEnum.tafsirList.name,
      value.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  static void addTafsir(TafsirModel value) {
    final tafsirList = getTafsirList();
    if (tafsirList.any((element) => element.fileName == value.fileName)) return;
    tafsirList.add(value);
    setTafsirList(tafsirList);
  }

  static void removeTafsir(String value) {
    final tafsirList = getTafsirList();
    tafsirList.removeWhere((element) => element.fileName == value);
    setTafsirList(tafsirList);
  }
}
