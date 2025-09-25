import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/splash_home_page.dart';
import 'app_lifycycle_observer.dart';
import 'main_app_material_widget.dart';
import 'multi_bloc_providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppLifecycleObserver(
      child: MultiBlocProvidersPage(
        body: AppMaterialWidget(homeWidget: SplashHomePage()),
      ),
    );
  }
}
