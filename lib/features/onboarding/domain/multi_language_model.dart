import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_app/extensions/context_extensions.dart';

class MultiLanguageModel extends Equatable {
  final String arabic;
  final String english;

  const MultiLanguageModel({
    required this.arabic,
    required this.english,
  });

  String displayText(BuildContext context) {
    return context.isArabic ? arabic : english;
  }

  factory MultiLanguageModel.fromJson(Map<String, dynamic> json) {
    return MultiLanguageModel(
      arabic: json['arabic'] as String? ?? '',
      english: json['english'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'arabic': arabic,
      'english': english,
    };
  }

  @override
  List<Object?> get props => [arabic, english];

  @override
  String toString() {
    return 'MultiLanguageModel{arabic: $arabic, english: $english}';
  }
}
