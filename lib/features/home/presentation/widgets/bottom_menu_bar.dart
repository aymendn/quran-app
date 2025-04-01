import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/home/presentation/home_controller.dart';
import 'package:quran_app/features/home/presentation/widgets/animated_show_hide.dart';
import 'package:quran_app/features/home/presentation/widgets/bookmark_menu.dart';
import 'package:quran_app/features/home/presentation/widgets/expandable_section.dart';
import 'package:quran_app/features/home/presentation/widgets/menu_wrapper.dart';
import 'package:quran_app/features/tafsir/presentation/tafsir_bottom_sheet.dart';
import 'package:quran_app/i18n/strings.g.dart';

class BottomMenuBar extends ConsumerWidget {
  const BottomMenuBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider);
    final notifier = ref.read(homeControllerProvider.notifier);

    void openTafsir() {
      showFlexibleBottomSheet(
        minHeight: 0.2,
        initHeight: 0.8,
        maxHeight: 1,
        context: context,
        barrierColor: Colors.black.withOpacity(0.4),
        bottomSheetBorderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
        bottomSheetColor: context.theme.scaffoldBackgroundColor,
        builder: (context, scrollController, bottomSheetOffset) {
          return TafsirBottomSheet(
            scrollController: scrollController,
            bottomSheetOffset: bottomSheetOffset,
          );
        },
        anchors: [0, 0.8, 1],
        isSafeArea: true,
      );
    }

    return MenuWrapper(
      direction: AnimationDirection.appearFromBottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpandableSection(
            expand: controller.isShowBookmarkMenu,
            child: const BookmarkMenu(),
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: openTafsir,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  icon: Icon(
                    Symbols.book_rounded,
                    size: 16.spMin,
                  ),
                  label: Text(
                    context.t.tafsir,
                  ),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: notifier.toggleBookmarkMenu,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: controller.isShowBookmarkMenu
                        ? Colors.white10
                        : Colors.transparent,
                  ),
                  icon: Icon(Symbols.bookmark, size: 16.spMin),
                  label: Text(context.t.bookmark),
                ),
              ),
              // Will be implemented later
              // Expanded(
              //   child: TextButton.icon(
              //     onPressed: () {},
              //     style: TextButton.styleFrom(
              //       foregroundColor: Colors.white,
              //     ),
              //     icon: Icon(
              //       Symbols.undo,
              //       size: 16.spMin,
              //     ),
              //     label: const Text(
              //       '250',
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
