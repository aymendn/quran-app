import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/home/presentation/home_screen.dart';
import 'package:quran_app/features/index/presentation/index_screen.dart';
import 'package:quran_app/features/onboarding/presentation/downlaod/download_screen.dart';
import 'package:quran_app/features/onboarding/presentation/onboarding/onboarding_screen.dart';
import 'package:quran_app/features/settings/presentation/settings_screen.dart';
import 'package:quran_app/router/custom_go_route.dart';
import 'package:quran_app/router/route_utils.dart';
import 'package:quran_app/router/routes.dart';

final routeInformationProvider =
    ChangeNotifierProvider<GoRouteInformationProvider>((ref) {
  final router = ref.watch(goRouterProvider);
  return router.routeInformationProvider;
});

final currentRouteProvider = Provider<String>((ref) {
  return ref.watch(routeInformationProvider).value.uri.pathSegments.first;
});

final goRouterProvider = Provider<GoRouter>((ref) {
  final routerNotifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/onboarding',
    refreshListenable: routerNotifier,
    routes: routerNotifier.routes,
    redirect: routerNotifier.redirect,
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    init();
  }
  final Ref ref;
  bool get isLogged {
    return false;
    // return ref.read(tokenControllerProvider) != null;
  }

  void init() {
    // ref.listen(initialRouteProvider, (_, __) {
    //   notifyListeners();
    // });
  }

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    return RouteUtils.redirect(state: state, ref: ref);
  }

  final List<RouteBase> routes = [
    // home
    CustomGoRoute(
      path: '/home',
      name: Routes.home.name,
      page: const HomeScreen(),
      routes: [
        CustomGoRoute(
          path: 'settings',
          name: Routes.settings.name,
          page: const SettingsScreen(),
        ),
        CustomGoRoute(
          path: 'index',
          name: Routes.index_.name,
          page: const IndexScreen(),
        ),
        CustomGoRoute(
          path: 'tafsir',
          name: Routes.tafsir.name,
          page: const IndexScreen(),
        ),
      ],
    ),

    // onboarding
    CustomGoRoute(
      path: '/onboarding',
      name: Routes.onboarding.name,
      page: const OnboardingScreen(),
    ),

    // download
    CustomGoRoute(
      path: '/download',
      name: Routes.download.name,
      page: const DownloadScreen(),
    ),
  ];
}
