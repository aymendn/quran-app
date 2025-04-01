import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/home/domain/chapter_model.dart';
import 'package:quran_app/features/home/presentation/home_controller.dart';

class ChapterCard extends ConsumerWidget {
  const ChapterCard(this.chapter, {super.key});

  final ChapterModel chapter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTap() {
      context.pop();
      ref.read(homeControllerProvider.notifier).goToPage(chapter.firstPage);
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onSurface.withOpacity(.03),
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            chapter.id.toString(),
            style: context.textTheme.bodyMedium,
          ),
        ),
        title: Text(chapter.name(context)),
        subtitle: Text(chapter.dataFormatted(context)),
        trailing: Icon(
          Symbols.arrow_back_ios,
          size: 14.spMin,
          color: context.colorScheme.onSurface.withOpacity(.4),
        ),
      ),
    );
  }
}
