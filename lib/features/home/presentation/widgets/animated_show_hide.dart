import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum AnimationDirection {
  appearFromTop,
  appearFromBottom;

  bool reverse(bool isShow) {
    if (this == appearFromTop) {
      return isShow;
    } else {
      return !isShow;
    }
  }
}

class AnimatedShowHide extends StatelessWidget {
  const AnimatedShowHide({
    super.key,
    required this.child,
    required this.isShow,
    required this.direction,
  });

  final Widget child;
  final bool isShow;
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: 200.ms,
      reverse: direction.reverse(isShow),
      transitionBuilder: (
        Widget child,
        Animation<double> primaryAnimation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          fillColor: Colors.transparent,
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        );
      },
      layoutBuilder: (List<Widget> entries) {
        return Stack(
          alignment: Alignment.topCenter,
          children: entries,
        );
      },
      child: isShow ? child : const SizedBox.shrink(),
    );
  }
}
