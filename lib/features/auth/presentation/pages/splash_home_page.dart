import 'dart:async';

import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/routers/app_route.dart';
import 'package:expense_tracker_lite/core/widgets/common_title_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/helpers/shared_texts.dart';
import '../../../../core/routers/route_names.dart';

class SplashHomePage extends StatefulWidget {
  const SplashHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  Future goToNextPage() async {
    Timer(
      const Duration(milliseconds: 2500),
      () => router.goNamed(RouteNames.bottomNavHomePage),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 2000),
        )..addListener(() {
          setState(() {});
        });
    controller.forward();

    goToNextPage();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.bgWhite,
      body: Center(
        child: SizedBox(
          width: SharedText.screenWidth,
          height: SharedText.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CommonText('Expenset.', fontSize: 34),
              getSpaceHeight(56),
              Container(
                color: Colors.transparent,
                width: getWidgetWidth(238),
                height: getWidgetHeight(12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppConstants.radius14),
                  ),
                  child: LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                    backgroundColor: context.appColors.bgWhite,
                    color: context.appColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
