import 'package:flutter/material.dart';
import 'package:quran_app/features/home/data/quran_data.dart';
import 'package:quran_app/features/index/presentation/chapter_card.dart';

class ChaptersView extends StatelessWidget {
  const ChaptersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: QuranData.chapters.length,
      itemBuilder: (BuildContext context, int index) {
        return ChapterCard(QuranData.chapters[index]);
      },
    );
  }
}
