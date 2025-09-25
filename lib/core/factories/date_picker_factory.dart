import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DatePickerFactory {
  Future<DateTime?> showPicker(
    BuildContext context,
    Function(DateTime) onDateTimeChanged,
  );

  factory DatePickerFactory(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return IOSDatePicker();
      case TargetPlatform.android:
      default:
        return AndroidDatePicker();
    }
  }
}

class AndroidDatePicker implements DatePickerFactory {
  @override
  Future<DateTime?> showPicker(
    BuildContext context,
    Function(DateTime) onDateTimeChanged,
  ) async {
    final now = DateTime.now();
    return await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
}

class IOSDatePicker implements DatePickerFactory {
  @override
  Future<DateTime?> showPicker(
    BuildContext context,
    Function(DateTime) onDateTimeChanged,
  ) async {
    final completer = Completer<DateTime?>();

    final now = DateTime.now();

    showCupertinoModalPopup(
      context: context,
      builder: (_) => IntrinsicHeight(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            height: 280,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: now,
              minimumDate: DateTime(2000),
              maximumDate: DateTime(2100),
              onDateTimeChanged: onDateTimeChanged,
            ),
          ),
        ),
      ),
    );

    return completer.future;
  }
}

class PlatformDatePicker {
  static Future<DateTime?> show(
    BuildContext context,
    Function(DateTime) onDateTimeChanged,
  ) {
    return DatePickerFactory(
      Theme.of(context).platform,
    ).showPicker(context, onDateTimeChanged);
  }
}
