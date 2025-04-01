
abstract class Azkar {
  static final azkarList = [
    Zikr(
      'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
      const Duration(seconds: 4),
    ),
    Zikr(
      'سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ',
      const Duration(seconds: 5),
    ),
    Zikr(
      'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
      const Duration(seconds: 5),
    ),
    Zikr(
      'لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ.',
      const Duration(seconds: 12),
    ),
    Zikr(
      'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
      const Duration(seconds: 5),
    ),
    Zikr(
      'أستغفر الله',
      const Duration(seconds: 4),
    ),
    Zikr(
      'سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ ',
      const Duration(seconds: 6),
    ),
    Zikr(
      'لَا إِلَهَ إِلَّا اللَّهُ',
      const Duration(seconds: 4),
    ),
  ];
}

class Zikr {
  final String text;
  final Duration duration;

  Zikr(this.text, this.duration);
}
