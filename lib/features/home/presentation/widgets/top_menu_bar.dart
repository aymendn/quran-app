import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/features/home/presentation/widgets/animated_show_hide.dart';
import 'package:quran_app/features/home/presentation/widgets/menu_wrapper.dart';
import 'package:quran_app/features/home/presentation/widgets/switch_theme_mode_button.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/router/routes.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuWrapper(
      direction: AnimationDirection.appearFromTop,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          TextButton.icon(
            icon: Icon(Symbols.menu_rounded, size: 18.spMin),
            onPressed: () => context.goNamed(Routes.index_.name),
            label: Text(context.t.index),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          ),
          const Spacer(),
          const SwitchThemeModeButton(),
          IconButton(
            icon: const Icon(
              Symbols.settings_rounded,
              weight: 300,
            ),
            onPressed: () => context.goNamed(Routes.settings.name),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
