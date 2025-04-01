import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color operator +(Color other) => Color.alphaBlend(this, other);

  Color merge(Color other) => Color.alphaBlend(this, other);

  Color mergeWithWhite() => Color.alphaBlend(this, Colors.white);
}
