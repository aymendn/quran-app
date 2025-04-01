import 'dart:math';

abstract class HelperFunctions {
  static String generateArabicLoremIpsum(int numberOfWords) {
    final List<String> arabicWords = [
      'لوريم',
      'إيبسوم',
      'دولور',
      'سيت',
      'أميت',
      'كونسيكتيتور',
      'أدايبا',
      'يسكينج',
      'أليايت',
      'سيد',
      'دو',
      'أيوسمود',
      'تيمبور',
      'أنكايديديونتيوت',
      'لابوري',
      'ات',
      'دولار',
      'ماجنا',
      'أليكيوا',
      'يوت',
      'انيم',
      'أد',
      'مينيم',
      'فينايم',
      'كيواس',
      'نوستريد',
      'أكسير',
      'سيتاشن',
      'يللأمكو',
      'لابورأس',
      'نيسي',
      'يت',
      'أليكيوب',
      'أكس',
      'أيا',
      'كوممودو',
      'كونسيكيوات',
      'ديواس',
      'أيوتي',
      'أريري',
      'دولار',
      'إن',
      'ريبريهينديرأيت',
      'فوليوبتاتي',
      'فيلايت',
      'أيسسي',
      'كايلليوم',
      'دولار',
      'أيو',
      'فيجايت',
      'نيولا',
      'باراياتيور'
    ];

    final random = Random();
    final StringBuffer result = StringBuffer();

    for (int i = 0; i < numberOfWords; i++) {
      if (i > 0) result.write(' ');
      result.write(arabicWords[random.nextInt(arabicWords.length)]);
    }

    return result.toString();
  }
}