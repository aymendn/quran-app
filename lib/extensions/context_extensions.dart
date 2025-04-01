import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/theme/colors.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColors get colors => isDark ? AppColors.dark : AppColors.light;
  ColorScheme get colorScheme => theme.colorScheme;
  NavigatorState get navigator => Navigator.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TextTheme get textTheme => theme.textTheme;
  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;

  FocusScopeNode get focusScope => FocusScope.of(this);
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  EdgeInsets get viewPaddingWithoutInsets => viewPadding - viewInsets;
  EdgeInsets get paddingWithoutViewInsets => padding - viewPadding;
  double get topInset => viewInsets.top;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  TextDirection get direction => Directionality.of(this);
  bool get isRtl => direction == TextDirection.rtl;
  bool get isLtr => direction == TextDirection.ltr;

  bool get isArabic => locale.languageCode == 'ar';
  bool get isEnglish => locale.languageCode == 'en';

  String get themeAsText {
    if (isDark) return this.t.dark;
    return this.t.light;
  }

  String get languageAsText {
    if (localeLanguageCode == 'en') return this.t.english;
    return this.t.arabic;
  }

  Locale get locale => Localizations.localeOf(this);
  String get localeLanguageCode => locale.languageCode;

  void closeKeyboard() {
    focusScope.unfocus();
  }

  TextStyle? get textFieldHintStyle => textTheme.bodyMedium?.copyWith(
        color: colors.label,
      );
  TextStyle? get textFieldLabelStyle => textTheme.labelLarge?.copyWith(
        color: colors.textSecondary,
      );

  // snackbar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? 3.seconds,
        action: action,
      ),
    );
  }

  // dialog
  Future<T?> customWidgetDialog<T>(
    Widget child, {
    bool barrierDismissible = true,
  }) {
    return showModal<T>(
      context: this,
      builder: (context) => child,
      configuration: FadeScaleTransitionConfiguration(
        transitionDuration: 350.ms,
        reverseTransitionDuration: 200.ms,
        barrierDismissible: barrierDismissible,
      ),
    );
  }
}
