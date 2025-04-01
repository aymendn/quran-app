import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/router/app_router.dart';
import 'package:quran_app/theme/theme.dart';
import 'package:quran_app/theme/theme_controller.dart';

class QuranApp extends HookConsumerWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final themeMode = ref.watch(themeProvider);

    ref.listen(
      currentRouteProvider,
      (previous, next) {
        logger.fine('Route changed from $previous to $next');
      },
    );

    return MaterialApp.router(
      routerConfig: router,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
    );
  }
}
