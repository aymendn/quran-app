import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/theme/theme_controller.dart';

class ChooseThemeDialog extends HookConsumerWidget {
  const ChooseThemeDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useState(ref.watch(themeProvider));

    void save() {
      ref.read(themeProvider.notifier).setThemeMode(theme.value);
      context.pop();
    }

    return AlertDialog(
      title: Text(context.t.chooseThemeMode),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<ThemeMode>(
            title: Text(context.t.dark),
            value: ThemeMode.dark,
            groupValue: theme.value,
            onChanged: (v) => theme.value = v!,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          RadioListTile<ThemeMode>(
            title: Text(context.t.light),
            value: ThemeMode.light,
            groupValue: theme.value,
            onChanged: (v) => theme.value = v!,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: Text(context.t.cancel),
        ),
        FilledButton(
          onPressed: save,
          child: Text(context.t.save),
        ),
      ],
    );
  }
}
