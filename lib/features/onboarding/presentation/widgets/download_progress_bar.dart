import 'package:flutter/material.dart';

class DownloadProgressBar extends StatelessWidget {
  const DownloadProgressBar({super.key, this.progress});

  final int? progress;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress == null ? null : progress! / 100,
      minHeight: 6,
      borderRadius: BorderRadius.zero,
    );
  }
}
