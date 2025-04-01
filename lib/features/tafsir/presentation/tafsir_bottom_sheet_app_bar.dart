import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/i18n/strings.g.dart';

class TafsirBottomSheetAppBar extends ConsumerWidget {
  const TafsirBottomSheetAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(context.t.tafsir),
      leading: const CloseButton(),
    );
  }
}
