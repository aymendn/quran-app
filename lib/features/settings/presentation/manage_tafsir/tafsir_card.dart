import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/common_widgets/custom_loading.dart';
import 'package:quran_app/common_widgets/confirm_delete_dialog.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/onboarding/domain/tafsir_model.dart';
import 'package:quran_app/features/settings/presentation/manage_tafsir/tafsir_card_controller.dart';
import 'package:quran_app/i18n/strings.g.dart';

class TafsirCard extends ConsumerWidget {
  const TafsirCard(
    this.tafsir, {
    super.key,
    required this.isSelected,
  });

  final TafsirModel tafsir;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tafsirCardControllerProvider(tafsir));
    final notifier = ref.read(tafsirCardControllerProvider(tafsir).notifier);

    final isShowOverlay = !isSelected &&
        (controller.downloadStatus.isLoading ||
            controller.downloadStatus.hasError);

    void onDelete() {
      context.customWidgetDialog(
        ConfirmDeleteDialog(
          onConfirm: notifier.deleteTafsir,
        ),
      );
    }

    return Stack(
      children: [
        AnimatedOpacity(
          opacity: isShowOverlay ? 0.5 : 1,
          duration: const Duration(milliseconds: 300),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: isSelected
                    ? context.colors.primary.withOpacity(.4)
                    : context.colors.stroke,
              ),
            ),
            selected: isSelected,
            selectedTileColor: context.colors.primary.withOpacity(0.05),
            selectedColor: context.colors.primary,
            leading: Icon(
              isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
              color: isSelected ? context.colors.primary : Colors.grey,
              size: 24.rm,
            ),
            onTap: isSelected ? null : notifier.startDownloading,
            title: Text(tafsir.name.displayText(context)),
            subtitle: Text(tafsir.description.displayText(context)),
            trailing: isSelected
                ? IconButton.filledTonal(
                    onPressed: onDelete,
                    icon: Icon(Symbols.delete),
                    color: context.colors.error,
                    iconSize: 20.rm,
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.download_rounded,
                        size: 18.rm,
                      ),
                      6.gapH,
                      Text('${tafsir.size} MB'),
                    ],
                  ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        // show either: error or progress
        if (isShowOverlay && controller.downloadStatus.isLoading) ...[
          Positioned.fill(
            child: AnimatedFractionallySizedBox(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCirc,
              widthFactor: controller.downloadProgress,
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                color: context.colors.primary.withOpacity(0.2),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: CustomLoading.withTextRow(
                text: '${context.t.downloading} ${controller.downloadProgressInt} %',
                size: 14.rm,
              ),
            ),
          ),
        ],

        if (isShowOverlay && controller.downloadStatus.hasError) ...[
          Positioned.fill(
            child: Container(
              color: context.colors.primary.withOpacity(0.1),
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.error_outline_rounded),
                  onPressed: notifier.startDownloading,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: context.colors.error,
                    size: 20.rm,
                  ),
                  8.gapW,
                  Text(
                    context.t.downloadingErrorMessage,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.error,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
