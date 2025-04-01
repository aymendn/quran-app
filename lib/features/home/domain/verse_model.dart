import 'package:equatable/equatable.dart';

class Verse extends Equatable {
  final int sura;
  final int ayah;
  final String text;

  const Verse({
    required this.sura,
    required this.ayah,
    required this.text,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      sura: json['sura'] as int,
      ayah: json['ayah'] as int,
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sura': sura,
      'ayah': ayah,
      'text': text,
    };
  }

  @override
  List<Object?> get props => [sura, ayah, text];

  @override
  bool get stringify => true;
}
