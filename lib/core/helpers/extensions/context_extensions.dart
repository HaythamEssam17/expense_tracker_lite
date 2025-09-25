import 'package:expense_tracker_lite/core/helpers/extensions/text_colors_extension.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import 'app_colors_extension.dart';

extension ContextExtensions on BuildContext {
  /// [hideKeyboard] a function to close the keyboard.
  void hideKeyboard() => FocusScope.of(this).requestFocus(FocusNode());

  /// [theme_feature] is a [ThemeData] that contains information about screen theme_feature.
  ThemeData get theme => Theme.of(this);

  /// [textTheme] is a [TextTheme] that contains information about screen text theme_feature.
  TextTheme get textTheme => Theme.of(this).textTheme;

  AppColorsExtension get appColors => theme.appColors;

  TextColorsExtension get textColors => theme.textColors;
}
