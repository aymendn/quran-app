import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/features/home/presentation/bookmark_controller.dart';
import 'package:quran_app/features/home/presentation/home_controller.dart';
import 'package:quran_app/i18n/strings.g.dart';

class BookmarkMenu extends ConsumerWidget {
  const BookmarkMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = ref.watch(bookmarkControllerProvider);
    final currentPage = ref.watch(currentPageProvider);
    final notifier = ref.read(bookmarkControllerProvider.notifier);

    final hasBookmark = bookmark != null;
    final isCurrentPage = bookmark == currentPage;
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: () => notifier.setBookmark(currentPage),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: Icon(
                isCurrentPage ? Symbols.bookmark_added : Symbols.bookmark_add,
                fill: isCurrentPage ? 1 : 0,
                color: isCurrentPage ? Colors.yellow : Colors.white,
                size: 16.spMin,
              ),
              label: Text(
                isCurrentPage ? context.t.savedHere : context.t.saveBookmark,
                style: TextStyle(
                  color: isCurrentPage ? Colors.yellow : Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              onPressed: (hasBookmark && !isCurrentPage)
                  ? notifier.goToBookmark
                  : null,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white24,
              ),
              icon: Icon(Symbols.move_item, size: 16.spMin),
              label: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.t.goToBookmark),
                  if (hasBookmark && !isCurrentPage)
                    Text(
                      '${context.t.savedInPage} $bookmark',
                      style: TextStyle(
                        fontSize: 10.spMin,
                        color: Colors.white24,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
