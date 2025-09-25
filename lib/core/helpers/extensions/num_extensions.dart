import '../../responsive_ui/size_util.dart';

extension SizeExtension on num {
  double get w {
    if (isDesktop) return this * scaleWidth * 0.8;
    if (isIpad) return this * scaleWidth * 0.9;
    return this * scaleWidth;
  }

  double get h {
    if (isDesktop) return this * scaleHeight * 0.8;
    if (isIpad) return this * scaleHeight * 0.9;
    return this * scaleHeight;
  }

  double get sp {
    double base = this * scaleWidth;
    if (isDesktop) return base * 0.85;
    if (isIpad) return base * 0.9;
    return base;
  }
}
