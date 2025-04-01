import 'package:flutter/material.dart';

extension ColorExt on ColorScheme {
  bool get isLight => brightness == Brightness.light;
  bool get isDark => brightness == Brightness.dark;
}

class AppColors {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.appBarBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.stroke,
    required this.strokeDarker,
    required this.label,
    required this.bg,
    required this.error,
    required this.success,
    required this.navBarBackground,
    required this.gradient,
    required this.quranPageBackground,
  });

  static const light = AppColors(
    primary: Color(0xFF673E00),
    secondary: Color(0xFFFFE4A1),
    appBarBackground: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF492E05),
    textSecondary: Color(0xB4563400),
    stroke: Color(0xFFEAEBEB),
    strokeDarker: Color(0xFFD1D2D2),
    label: Color(0xFFA8ADAF),
    bg: Color.fromARGB(255, 255, 247, 228),
    error: Color(0xFFEA4335),
    success: Color(0xFF11CC43),
    navBarBackground: Color(0xFF1D1E40),
    gradient: [Color(0xFFFFE4A1), Color(0xFFFFF3DF)],
    quranPageBackground: Color(0xFFFFFFFF),
  );

  static const dark = AppColors(
    primary: Color(0xFF673E00),
    secondary: Color(0xFFFFE4A1),
    appBarBackground: Color(0xFF1D1E40),
    textPrimary: Color(0xFFE0E0E0),
    textSecondary: Color(0xFFA8ADAF),
    stroke: Color(0xFF2C2C2C),
    strokeDarker: Color(0xFF1F1F1F),
    label: Color(0xFFA8ADAF),
    bg: Color(0xFF121212),
    error: Color(0xFFEA4335),
    success: Color(0xFF11CC43),
    navBarBackground: Color(0xFF1D1E40),
    gradient: [Color(0xFF1D1E40), Color(0xFF121212)],
    quranPageBackground: Color.fromARGB(255, 0, 0, 0),
  );

  final Color primary;
  final Color secondary;
  final Color appBarBackground;
  final Color textPrimary;
  final Color textSecondary;
  final Color stroke;
  final Color strokeDarker;
  final Color label;
  final Color bg;
  final Color error;
  final Color success;
  final Color navBarBackground;
  final Color quranPageBackground;
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color blue = const Color(0xff2299DD);
  final Color purple = const Color(0xff8385E4);
  final Color scaffoldBackground = const Color(0xffF1E1BA);
  // gradient
  final List<Color> gradient;

  // grey shades
  Color get grey50 => Colors.grey.shade50;
  Color get grey100 => Colors.grey.shade100;
  Color get grey150 => const Color(0xFFF0F0F0);
  Color get grey200 => Colors.grey.shade200;
  Color get grey300 => Colors.grey.shade300;
  Color get grey400 => Colors.grey.shade400;
  Color get grey500 => Colors.grey.shade500;
  Color get grey600 => Colors.grey.shade600;
  Color get grey700 => Colors.grey.shade700;
  Color get grey800 => Colors.grey.shade800;
  Color get grey900 => Colors.grey.shade900;
}
