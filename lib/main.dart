import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/app.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';
import 'package:quran_app/utils/io.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * Initialize IO
  await IO.init();

  // * Initialize shared preferences
  await SharedPreferencesService.init();


  // // * Initialize db
  // await QuranDBService.init();

  // * Make GoRouter's push and pop methods work on web urls
  GoRouter.optionURLReflectsImperativeAPIs = true;

  // * turn off the # in the URLs on the web
  usePathUrlStrategy();

  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors
  registerErrorHandlers();

  runApp(
    ProviderScope(
      child: TranslationProvider(
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          builder: (_, __) => const QuranApp(),
        ),
      ),
    ),
  );
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Text(
                details.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  };
}
