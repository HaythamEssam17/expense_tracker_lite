import 'package:flutter/material.dart';

// class SizeUtil {
late double screenWidth;
late double screenHeight;
late double scaleWidth;
late double scaleHeight;

const double designWidth = 375;
const double designHeight = 812;

late Orientation orientation;

void initSizeUtil(BuildContext context) {
  final size = MediaQuery.of(context).size;
  orientation = MediaQuery.of(context).orientation;

  screenWidth = size.width;
  screenHeight = size.height;

  scaleWidth = screenWidth / designWidth;
  scaleHeight = screenHeight / designHeight;
}

bool get isLandscape => orientation == Orientation.landscape;

bool get isPortrait => orientation == Orientation.portrait;

bool get isMobile =>
    (screenWidth < 600 && screenHeight < 900) ||
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.shortestSide <
        600;

bool get isIpad =>
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.shortestSide >=
        600 &&
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.shortestSide <
        1024;

bool get isDesktop =>
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.shortestSide >=
    1024;
// }
