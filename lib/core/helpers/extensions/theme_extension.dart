import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors_extension.dart';
import 'text_colors_extension.dart';

extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppColorsExtension();

  TextColorsExtension get textColors =>
      extension<TextColorsExtension>() ?? TextColorsExtension();

  bool get isDark => brightness == Brightness.dark;

  SystemUiOverlayStyle get systemUiOverlayStyle =>
      isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
}
