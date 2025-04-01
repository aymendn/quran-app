import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/assets/fonts.gen.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/onboarding/data/azkar.dart';

class AzkarSlider extends HookWidget {
  const AzkarSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    // Change index with dynamic duration
    useEffect(() {
      void changeIndex() {
        index.value = (index.value + 1) % Azkar.azkarList.length;
        Duration duration = Azkar.azkarList[index.value].duration;
        Timer(duration, changeIndex);
      }

      // Start the first timer
      Timer(Azkar.azkarList[index.value].duration, changeIndex);

      return null;
    }, []);

    return PageTransitionSwitcher(
      duration: 300.ms,
      reverse: true,
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
      child: Animate(
        key: ValueKey(index.value),
        effects: [
          BlurEffect(
            delay: 100.ms,
            duration: 400.ms,
            curve: Curves.easeOut,
            begin: const Offset(4, 4),
            end: Offset.zero,
          ),
        ],
        child: Text(
          Azkar.azkarList[index.value].text,
          key: ValueKey(index.value),
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.uthmanTN,
            fontSize: 36.spMin,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
