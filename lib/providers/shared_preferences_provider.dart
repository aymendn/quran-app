import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefsEnum {
  isDarkMode,
  pageNumber,
  bookmark,
  locale,
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
}
