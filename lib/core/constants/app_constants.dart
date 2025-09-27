import 'dart:math';

import 'package:flutter/material.dart';

class AppConstants {
  /// Radius
  static const double radius10 = 10;
  static const double radius14 = 14;
  static const double radius22 = 22;

  static Random random = Random();
  static const List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.brown,
  ];

  static Color get baseColor => colors[random.nextInt(colors.length)];

  static Color get containerColor => baseColor.withOpacity(0.2);

  static Color get iconColor => baseColor.withOpacity(0.7);

  static HSLColor hsl = HSLColor.fromColor(baseColor);
  static Color lightColor = hsl
      .withLightness((hsl.lightness + 0.4).clamp(0.0, 1.0))
      .toColor();
  static Color darkColor = hsl
      .withLightness((hsl.lightness - 0.3).clamp(0.0, 1.0))
      .toColor();
}
