import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/assets/assets.gen.dart';
import 'package:quran_app/common_widgets/custom_scaffold.dart';
import 'package:quran_app/common_widgets/scrollable_column.dart';
import 'package:quran_app/common_widgets/svg_icon.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/onboarding/presentation/downlaod/download_controller.dart';
import 'package:quran_app/features/onboarding/presentation/widgets/azkar_slider.dart';
import 'package:quran_app/features/onboarding/presentation/widgets/download_progress_bar.dart';
import 'package:quran_app/i18n/strings.g.dart';

class DownloadScreen extends HookConsumerWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(downloadControllerProvider);
    final notifier = ref.read(downloadControllerProvider.notifier);

    return CustomScaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: ScrollableColumn(
        constraintMinHeight: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        children: [
          SizedBox(height: 0.2.sh),
          Text(
            context.t.downloadWaitingMessage,
            style: context.textTheme.labelSmall,
          ),
          24.gapH,
          const AzkarSlider(),
          // CustomButton(onPressed: notifier.download, text: 'Download'),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.progressRatio,
                  style: context.textTheme.labelSmall),
              Text(controller.progressString,
                  style: context.textTheme.labelSmall),
            ],
          ),
          4.gapH,
          DownloadProgressBar(progress: controller.progressInt),
          24.gapH,
          SvgIcon(
            Assets.icons.quranText.path,
            size: 70.r,
            color: context.colorScheme.onSurface.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
