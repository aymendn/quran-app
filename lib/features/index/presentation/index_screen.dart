import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/common_widgets/custom_scaffold.dart';
import 'package:quran_app/features/index/presentation/chapters_view.dart';
import 'package:quran_app/features/index/presentation/quarters_view.dart';
import 'package:quran_app/i18n/strings.g.dart';

class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        appBar: AppBar(
          title: Text(context.t.index),
          bottom: TabBar(
            tabs: [
              Tab(text: context.t.chapters),
              Tab(text: context.t.quarters),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChaptersView(),
            QuartersView(),
          ],
        ),
      ),
    );
  }
}
