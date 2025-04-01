import 'package:quran_app/enums/riwaya_enum.dart';

abstract class Api {
  static const String baseUrl =
      'https://api.github.com/repos/aymendn/quran-data/contents';

  static String getQuranPageImageUrl(RiwayaEnum riwaya, int pageNumber) {
    return '$baseUrl/page-images/${riwaya.quranImagesFolder}/page${_pad(pageNumber)}.png';
  }

  static String getQuranPagesFolderUrl(RiwayaEnum riwaya) {
    return '$baseUrl/page-images/${riwaya.quranImagesFolder}';
  }

  static String getQuranDBUrl(RiwayaEnum riwaya) {
    return '$baseUrl/quran_text/quran_${riwaya.quranTextDBName}.db';
  }

  static String _pad(int number) {
    if (number < 10) {
      return '00$number';
    } else if (number < 100) {
      return '0$number';
    } else {
      return number.toString();
    }
  }
}
