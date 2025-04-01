import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/enums/riwaya_enum.dart';

abstract class IO {
  static late String supportFolderPath;

  static Future<void> init() async {
    supportFolderPath = (await getApplicationSupportDirectory()).path;
  }

  static String joinPaths(String path1, String path2) {
    return join(path1, path2);
  }

  static String getPageName(int pageNumber) {
    return 'page${_pad(pageNumber)}.png';
  }

  static String getPageLocalPath(RiwayaEnum riwaya, int pageNumber) {
    return join(supportFolderPath, riwaya.quranImagesFolder, getPageName(pageNumber));
  }

  static String getQuranDBPath(RiwayaEnum riwaya) {
    return join(
        supportFolderPath, 'quran_text', 'quran_${riwaya.quranTextDBName}.db');
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
