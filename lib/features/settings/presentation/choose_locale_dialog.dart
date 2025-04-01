import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';

class ChooseLocaleDialog extends HookConsumerWidget {
  const ChooseLocaleDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = useState(LocaleSettings.currentLocale.languageCode);

    void save() {
      ref.read(sharedPreferencesProvider).setLocale(locale.value);
      context.pop();
    }

    return AlertDialog(
      title: Text(context.t.chooseLanguage),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: _RadioText(
              context.t.english,
              context.t.englishOtherLanguage,
            ),
            value: 'en',
            groupValue: locale.value,
            onChanged: (value) {
              locale.value = value!;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          RadioListTile<String>(
            title: _RadioText(
              context.t.arabic,
              context.t.arabicOtherLanguage,
            ),
            value: 'ar',
            groupValue: locale.value,
            onChanged: (value) {
              locale.value = value!;
            },
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

class _RadioText extends StatelessWidget {
  const _RadioText(this.mainText, this.otherLanguageText);

  final String mainText;
  final String otherLanguageText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: mainText,
          ),
          TextSpan(
            text: ' ($otherLanguageText)',
            style: TextStyle(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
