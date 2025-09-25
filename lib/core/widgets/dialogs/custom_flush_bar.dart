import 'package:another_flushbar/flushbar.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

void showFlushBar({
  required BuildContext context,
  required String title,
  required String message,
  Color? color,
}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    titleColor: context.textColors.main,
    messageColor: context.textColors.light,
    message: message,
    safeArea: false,
    duration: const Duration(seconds: 4),
    backgroundColor: color ?? context.appColors.primaryColor,
    padding: const EdgeInsets.only(
      top: kToolbarHeight,
      left: 16,
      right: 16,
      bottom: 16,
    ),
  )..show(context);
}
