import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

CustomTransitionPage transitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  List<Override> providerScopeOverrides = const [],
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    name: state.name,
    child: providerScopeOverrides.isEmpty
        ? child
        : ProviderScope(
            overrides: providerScopeOverrides,
            child: child,
          ),
    transitionDuration: 320.ms,
    reverseTransitionDuration: 280.ms,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutQuint,
          reverseCurve: Curves.easeOutQuint.flipped,
        )),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.0),
            end: const Offset(-1.0, 0.0),
          ).animate(CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeOutQuint,
            reverseCurve: Curves.easeOutQuint.flipped,
          )),
          child: child,
        ),
      );
    },
  );
}

// Fadethrough transition
CustomTransitionPage fadeThroughTransitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeThroughTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );
    },
  );
}
