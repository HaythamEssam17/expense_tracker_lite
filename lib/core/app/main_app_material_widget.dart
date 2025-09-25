import 'package:flutter/material.dart';

import '../helpers/shared_texts.dart';
import '../responsive_ui/device_info.dart';
import '../responsive_ui/size_util.dart';
import '../responsive_ui/ui_components.dart';
import '../routers/app_route.dart';

class AppMaterialWidget extends StatelessWidget {
  final Widget homeWidget;

  const AppMaterialWidget({super.key, required this.homeWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Expense Tracker Lite',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      builder: (context, widget) => InfoComponents(
        builder: (BuildContext infoComponentsContext, DeviceInfo deviceInfo) {
          if (deviceInfo.orientation == Orientation.portrait) {
            SharedText.screenHeight = deviceInfo.screenHeight;
            SharedText.screenWidth = deviceInfo.screenWidth;
            SharedText.deviceType = deviceInfo;
          } else {
            SharedText.screenHeight = deviceInfo.screenWidth;
            SharedText.screenWidth = deviceInfo.screenHeight;
            SharedText.deviceType = deviceInfo;
          }

          /// Initialize Size Util
          initSizeUtil(context);

          return widget!;
        },
      ),
    );
  }
}
