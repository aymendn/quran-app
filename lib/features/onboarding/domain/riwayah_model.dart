import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/features/onboarding/domain/multi_language_model.dart';
import 'package:quran_app/i18n/strings.g.dart';

class RiwayahModel extends Equatable {
  final String url;
  final MultiLanguageModel name;
  final String riwayah;
  final String quality;
  final String fileName;
  final double size;

  const RiwayahModel({
    required this.url,
    required this.name,
    required this.riwayah,
    required this.quality,
    required this.fileName,
    required this.size,
  });

  String qualityDisplayText(BuildContext context) {
    if (quality == 'high') {
      return context.t.highQuality;
    }
    return context.t.lowQuality;
  }

  String get fileNameZip {
    return '$fileName.zip';
  }

  @override
  List<Object?> get props => [url, name, riwayah, quality, fileName, size];

  factory RiwayahModel.fromJson(Map<String, dynamic> json) {
    return RiwayahModel(
      url: json['url'] as String,
      name: MultiLanguageModel.fromJson(json['name']),
      riwayah: json['riwayah'] as String,
      quality: json['quality'] as String,
      fileName: json['file'] as String,
      size: (json['size'] as num).toDouble(),
    );
  }
}
