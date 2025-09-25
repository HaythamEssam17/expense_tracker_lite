import '../responsive_ui/device_info.dart';

class SharedText {
  static final SharedText _singleton = SharedText._internal();

  factory SharedText() {
    return _singleton;
  }

  SharedText._internal();

  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static double designWidth = 375.0;
  static double designHeight = 812.0;

  static DeviceInfo? deviceType;

  static String currentLocale = 'ar';
  static String deviceToken = '';

  /// On_Will_Pop app close time
  static DateTime? currentBackPressTime;

  static bool isARLocal() => currentLocale == 'ar';
}
