import 'package:flutter/material.dart';
import 'package:quran_app/common_widgets/custom_scaffold.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/features/home/presentation/widgets/bottom_menu_bar.dart';
import 'package:quran_app/features/home/presentation/widgets/pages_carousel.dart';
import 'package:quran_app/features/home/presentation/widgets/top_menu_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: context.colors.quranPageBackground,
      body: const Stack(
        children: [
          PagesCarousel(),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: BottomMenuBar(),
          ),
          Positioned(
            top: 8,
            left: 8,
            right: 8,
            child: TopMenuBar(),
          ),
        ],
      ),
    );
  }
}
