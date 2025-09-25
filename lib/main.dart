import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/app/bloc_observer.dart';
import 'core/app/my_app.dart';
import 'core/helpers/shared.dart';
import 'core/network/error_handling/dio_exception.dart';
import 'core/services/service_provider.dart';
import 'di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize .Env Environment to load the file.
  await dotenv.load(fileName: ".env");

  /// Initialize the services
  await initServicesProviders();

  final WidgetsBinding bind = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bind);

  await Future.delayed(const Duration(seconds: 2));

  FlutterNativeSplash.remove();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  FlutterError.onError = DioExceptions.onFlutterError;

  /// Initialize the GetIt dependencies
  configureDependencies();

  /// This function is to check the security of the app.
  /*
    [ParamsAppCheck] is a model contains the params we have to check,
    Params default values are equals to false
  */
  checkAppSecurity();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
