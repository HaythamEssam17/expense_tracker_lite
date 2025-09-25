import 'dart:developer' as developer;

import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:safe_device/safe_device.dart';

import '../responsive_ui/size_util.dart' as SharedText;

void devLog(String errorMessage) {
  developer.log('developer log: $errorMessage');
}

/// This function is to check the app security.
class SecurityException implements Exception {
  final String message;
  SecurityException(this.message);

  @override
  String toString() => "SecurityException: $message";
}

/// Get Widget Height
double getWidgetHeight(double height) {
  return (SharedText.screenHeight * (height / 812)).sp;
}

/// Get Widget Width
double getWidgetWidth(double width) {
  return (SharedText.screenWidth * (width / 375)).sp;
}

/// Get Space Height
SizedBox getSpaceHeight(double height) {
  final double currentHeight = SharedText.screenHeight * (height / 812);
  return SizedBox(height: currentHeight.sp);
}

/// Get Space Width
SizedBox getSpaceWidth(double width) {
  final double currentWidth = SharedText.screenWidth * (width / 375);
  return SizedBox(width: currentWidth.sp);
}

Future<void> checkAppSecurity() async {
  try {
    final isEmulated = !(await SafeDevice.isRealDevice);
    if (isEmulated) {
      throw SecurityException("App blocked: running on emulator.");
    }

    final isJailBroken = await SafeDevice.isJailBroken;
    if (isJailBroken) {
      throw SecurityException("App blocked: device is jailbroken/rooted.");
    }

    final canMockLocation = await SafeDevice.isMockLocation;
    if (canMockLocation) {
      throw SecurityException("App blocked: mock location detected.");
    }

    final onDevMode = await SafeDevice.isDevelopmentModeEnable;
    if (onDevMode) {
      throw SecurityException("App blocked: developer mode enabled.");
    }

    final onExternalStorage = await SafeDevice.isOnExternalStorage;
    if (onExternalStorage) {
      throw SecurityException("App blocked: installed on external storage.");
    }

    devLog("Security check passed ✅");
  } catch (e) {
    if (e is SecurityException) {
      rethrow;
    }
    throw SecurityException("App Security Failure --- $e");
  }
}

Future<void> blocUserFromUsingApp(BuildContext context) async {
  try {
    await checkAppSecurity();
  } on SecurityException catch (e) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Security Warning"),
        content: Text(e.message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Exit"),
          ),
        ],
      ),
    );
  }
}
