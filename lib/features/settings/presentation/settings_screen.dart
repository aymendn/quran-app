import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/common_widgets/custom_scaffold.dart';
import 'package:quran_app/common_widgets/scrollable_column.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/settings/presentation/choose_locale_dialog.dart';
import 'package:quran_app/features/settings/presentation/choose_theme_dialog.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/router/routes.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(context.t.settings),
      ),
      body: ScrollableColumn(
        children: [
          // theme selection
          ListTile(
            leading: const Icon(Symbols.dark_mode),
            onTap: () => context.customWidgetDialog(const ChooseThemeDialog()),
            title: Text(context.t.themeMode),
            trailing: Text(context.themeAsText),
          ),

          // language selection
          ListTile(
            leading: const Icon(Symbols.language),
            onTap: () => context.customWidgetDialog(const ChooseLocaleDialog()),
            title: Text(context.t.language),
            subtitle: Text(context.t.languageOtherLanguage),
            trailing: Text(context.languageAsText),
          ),

          // Manage Tafsir
          ListTile(
            leading: const Icon(Symbols.book),
            onTap: () => context.pushNamed(Routes.manageTafsir.name),
            title: Text(context.t.manageTafsir),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
