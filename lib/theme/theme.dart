import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/assets/fonts.gen.dart';
import 'package:quran_app/theme/colors.dart';

abstract final class AppTheme {
  const AppTheme();

  static String get fontFamily => FontFamily.rubik;

  static BorderRadius get buttonBorderRadius => BorderRadius.circular(8);

  static ThemeData get lightTheme => buildTheme(ThemeMode.light);
  static ThemeData get darkTheme => buildTheme(ThemeMode.dark);

  static ThemeData buildTheme(ThemeMode themeMode) {
    final isDark = themeMode == ThemeMode.dark;
    final colors = isDark ? AppColors.dark : AppColors.light;
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final defaultButtonTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.4,
    );

    return ThemeData(
      fontFamily: fontFamily,
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: colors.primary,
      ),
      iconTheme: IconThemeData(
        color: colors.textPrimary,
        fill: 0,
        weight: 400,
        grade: 200,
        opticalSize: 48,
        size: 22,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.textPrimary,
          textStyle: defaultButtonTextStyle,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: defaultButtonTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: buttonBorderRadius,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colors.strokeDarker),
          textStyle: defaultButtonTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: buttonBorderRadius,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
        titleSpacing: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.black45,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
        contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          color: colors.textSecondary,
          height: 1.4,
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.black45,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return null;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        visualDensity: VisualDensity.comfortable,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        side: BorderSide(
          color: colors.strokeDarker,
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          color: colors.textPrimary,
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        subtitleTextStyle: TextStyle(
          color: colors.label,
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        leadingAndTrailingTextStyle: TextStyle(
          color: colors.label,
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        horizontalTitleGap: 8,
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
          height: 1.6,
        ),
        titleMedium: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
          height: 1.4,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colors.textSecondary,
          height: 1.4,
        ),
        labelMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: colors.textSecondary,
          height: 1.4,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colors.textSecondary,
          height: 1.4,
        ),
      ),
    );
  }
}
