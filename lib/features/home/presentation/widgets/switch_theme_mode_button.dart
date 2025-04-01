import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/theme/theme_controller.dart';

class SwitchThemeModeButton extends ConsumerWidget {
  const SwitchThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(context.isDark ? Symbols.light_mode : Symbols.dark_mode),
      onPressed: ref.read(themeProvider.notifier).toggleThemeMode,
      color: Colors.white,
    );
  }
}
