import 'package:flutter/material.dart';
import 'package:quran_app/i18n/strings.g.dart';

enum RevelationEnum {
  meccan,
  medinan;

  static RevelationEnum fromArabicString(String value) {
     return value == 'مكية' ? meccan : medinan;
  }

  String text(BuildContext context) {
    return switch (this) {
      meccan => context.t.meccan,
      medinan => context.t.medinan,
    };
  }
}