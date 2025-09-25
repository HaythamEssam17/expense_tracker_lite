import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart';
import '../helpers/shared_texts.dart';
import '../widgets/dialogs/custom_flush_bar.dart';

class AppScaffoldPage extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Color? backgroundColor;
  final Color? statusBarColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const AppScaffoldPage({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
    this.backgroundColor,
    this.statusBarColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  State<AppScaffoldPage> createState() => _AppScaffoldPageState();
}

class _AppScaffoldPageState extends State<AppScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: widget.statusBarColor ?? Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: widget.backgroundColor ?? Colors.white,
        drawer: widget.drawer,
        drawerEnableOpenDragGesture: false,
        bottomNavigationBar: widget.bottomNavigationBar,
        appBar: widget.appBar == null ? null : widget.appBar,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocConsumer<ConnectivityCubit, ConnectivityState>(
          listener: (connectivityCxt, connectivityState) {
            if (connectivityState is InternetDisconnected) {
              showFlushBar(
                context: context,
                title: 'Network disconnected',
                message: 'Please check your internet connection',
                color: context.appColors.blue100,
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              top: false,
              bottom: false,
              child: GestureDetector(
                onTap: () => context.hideKeyboard(),
                child: SizedBox(
                  height: SharedText.screenHeight,
                  width: SharedText.screenWidth,
                  child: widget.body,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
