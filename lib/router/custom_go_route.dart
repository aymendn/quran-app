import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/router/custom_transition.dart';

class CustomGoRoute extends GoRoute {
  CustomGoRoute({
    required super.path,
    super.name,
    required this.page,
    this.transition = transitionPage,
    super.routes = const <RouteBase>[],
  }) : super(
          pageBuilder: (context, state) {
            return transitionPage(
              context: context,
              state: state,
              child: page,
            );
          },
        );
  final Widget page;
  final CustomTransitionPage Function({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) transition;
}
