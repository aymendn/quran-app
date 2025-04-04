import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/common_widgets/async_value_builder.dart';
import 'package:quran_app/common_widgets/custom_app_bar.dart';
import 'package:quran_app/common_widgets/custom_loading.dart';
import 'package:quran_app/common_widgets/custom_scaffold.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/settings/presentation/manage_tafsir/manage_tafsir_controller.dart';
import 'package:quran_app/features/settings/presentation/manage_tafsir/tafsir_card.dart';
import 'package:quran_app/i18n/strings.g.dart';

class ManageTafsirScreen extends ConsumerWidget {
  const ManageTafsirScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(manageTafsirControllerProvider);
    final notifier = ref.read(manageTafsirControllerProvider.notifier);

    return CustomScaffold(
      appBar:  CustomAppBar(
        title: context.t.manageTafsir,
      ),
      body: Column(
        children: [
          Expanded(
            child: AsyncValueBuilder(
              value: controller.tafsirListAsync,
              data: (tafsirList) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  itemCount: tafsirList.length,
                  separatorBuilder: (_, __) => 8.gapH,
                  itemBuilder: (BuildContext context, int index) {
                    final tafsir = controller.tafsirListOrdered[index];
                    return TafsirCard(
                      tafsir,
                      isSelected: controller.selectedTafsirList
                          .contains(tafsir.fileName),
                    );
                  },
                );
              },
              loading: () => const Center(child: CustomLoading()),
              onRefresh: notifier.fetchTafsirList,
            ),
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          //   decoration: BoxDecoration(
          //     color: context.colorScheme.surface,
          //     border: Border(top: BorderSide(color: context.colors.stroke)),
          //   ),
          //   child: CustomButton(
          //     text: context.t.download,
          //     onPressed: controller.isSelectedTafsir
          //         ? notifier.startDownloading
          //         : null,
          //     width: double.infinity,
          //   ),
          // ),
        ],
      ),
    );
  }
}
