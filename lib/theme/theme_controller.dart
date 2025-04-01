import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeMode>(
  (ref) => ThemeController(ref),
);

class ThemeController extends StateNotifier<ThemeMode> {
  final Ref ref;
  ThemeController(this.ref)
      : super(ref.read(sharedPreferencesProvider).getThemeMode());

  void setThemeMode(ThemeMode themeMode) {
    state = themeMode;
    ref.read(sharedPreferencesProvider).setThemeMode(themeMode);
  }

  void toggleThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    ref.read(sharedPreferencesProvider).setThemeMode(state);
  }
}
