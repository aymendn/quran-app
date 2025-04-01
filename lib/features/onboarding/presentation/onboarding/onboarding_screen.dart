import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/assets/assets.gen.dart';
import 'package:quran_app/common_widgets/custom_button.dart';
import 'package:quran_app/common_widgets/custom_scaffold.dart';
import 'package:quran_app/common_widgets/scrollable_column.dart';
import 'package:quran_app/common_widgets/svg_icon.dart';
import 'package:quran_app/debug/logger.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/settings/presentation/choose_locale_dialog.dart';
import 'package:quran_app/features/settings/presentation/choose_theme_dialog.dart';
import 'package:quran_app/i18n/strings.g.dart';
import 'package:quran_app/router/routes.dart';
import 'package:quran_app/utils/io.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logger.fine(IO.supportFolderPath);

    return CustomScaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: ScrollableColumn(
        constraintMinHeight: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
        children: [
          const Spacer(),
          SvgIcon(
            Assets.icons.quranText.path,
            size: 170.r,
            color: context.colorScheme.onSurface,
          ),
          const Spacer(),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              context.t.downloadRequired,
              style: context.textTheme.titleLarge,
            ),
          ),
          4.gapH,
          Text(
            context.t.fileDownloadMessage,
            style: context.textTheme.labelMedium,
          ),
          16.gapH,
          ListTile(
            leading: const Icon(Symbols.dark_mode),
            onTap: () => context.customWidgetDialog(const ChooseThemeDialog()),
            title: Text(context.t.themeMode),
            trailing: Text(context.themeAsText),
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // language selection
          ListTile(
            leading: const Icon(Symbols.language),
            onTap: () => context.customWidgetDialog(const ChooseLocaleDialog()),
            title: Text(context.t.language),
            subtitle: Text(context.t.languageOtherLanguage),
            trailing: Text(context.languageAsText),
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          12.gapH,
          CustomButton(
            text: context.t.download,
            onPressed: () => context.goNamed(Routes.download.name),
            width: double.infinity,
          ),
          8.gapH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Symbols.download_for_offline_rounded,
                size: 22.r,
                color: context.colors.textSecondary,
              ),
              4.gapW,
              Text(
                '${context.t.fileSize} 134 MB',
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
