import 'package:quran_app/extensions/double_extensions.dart';

class PageModel {
  final int surah;
  int hizbQuarter;
  int get hizb => (hizbQuarter / 4).fixedRound;
  int get juz => (hizbQuarter / 8).fixedRound;

  PageModel({
    required this.surah,
    required this.hizbQuarter,
  });
}
