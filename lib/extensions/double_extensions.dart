extension DoubleExt on double {
  int get fixedRound {
    if (this == roundToDouble()) return toInt();
    return toInt() + 1;
  }
}