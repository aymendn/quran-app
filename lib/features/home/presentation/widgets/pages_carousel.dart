import 'dart:io';

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/common_widgets/invert_color.dart';
import 'package:quran_app/enums/riwaya_enum.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/home/presentation/home_controller.dart';
import 'package:quran_app/features/home/presentation/widgets/adaptive_aspect_ratio.dart';
import 'package:quran_app/utils/io.dart';

class PagesCarousel extends ConsumerWidget {
  const PagesCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homeControllerProvider.notifier);
    return GestureDetector(
      onTap: notifier.toggleMenu,
      child: CarouselSlider.builder(
        controller: notifier.carouselController,
        itemCount: 604,
        options: CarouselOptions(
          reverse: context.isLtr,
          height: double.infinity,
          enableInfiniteScroll: false,
          viewportFraction: 0.999,
          initialPage: ref.read(homeControllerProvider).currentPage - 1,
          padEnds: false,
          onPageChanged: (index, reason) => notifier.setCurrentPage(index + 1),
        ),
        itemBuilder: (context, index, realIndex) {
          return Center(
            child: AdaptiveAspectRatio(
              aspcectRatioRange: (min: 0.48, max: 0.66),
              child: InvertColor(
                child: Image.file(
                  File(IO.getPageLocalPath(RiwayaEnum.warsh, index + 1)),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
