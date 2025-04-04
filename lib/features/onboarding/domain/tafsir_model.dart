import 'package:equatable/equatable.dart';
import 'package:quran_app/features/onboarding/domain/multi_language_model.dart';

class TafsirModel extends Equatable {
  final String url;
  final MultiLanguageModel name;
  final MultiLanguageModel description;
  final String fileName;
  final double size;
  final String tafsir;

  const TafsirModel({
    required this.url,
    required this.name,
    required this.description,
    required this.fileName,
    required this.size,
    this.tafsir = '',
  });

  String get fileNameZip => '$fileName.zip';

  @override
  List<Object?> get props => [fileName];

  factory TafsirModel.fromJson(Map<String, dynamic> json) {
    return TafsirModel(
      url: json['url'] as String? ?? '',
      name: MultiLanguageModel.fromJson(json['name'] ?? {}),
      description: MultiLanguageModel.fromJson(json['description'] ?? {}),
      fileName: json['file'] as String? ?? '',
      size: (json['size'] as num? ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'name': name.toJson(),
      'description': description.toJson(),
      'file': fileName,
      'size': size,
    };
  }

  TafsirModel copyWith({
    String? url,
    MultiLanguageModel? name,
    MultiLanguageModel? description,
    String? fileName,
    double? size,
    String? tafsir,
  }) {
    return TafsirModel(
      url: url ?? this.url,
      name: name ?? this.name,
      description: description ?? this.description,
      fileName: fileName ?? this.fileName,
      size: size ?? this.size,
      tafsir: tafsir ?? this.tafsir,
    );
  }
}
