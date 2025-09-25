import 'package:flutter/material.dart';

import 'hive/hive_service.dart';

abstract class ServiceProvider {
  Future<void> register();
}

final providers = <ServiceProvider>[HiveServiceProvider.i];

Future<void> initServicesProviders() async {
  for (final provider in providers) {
    try {
      await provider.register();
    } catch (e, stack) {
      Future.delayed(
        const Duration(seconds: 3),
      ).then((_) => debugPrint('stack error: $stack'));
    }
  }
}
