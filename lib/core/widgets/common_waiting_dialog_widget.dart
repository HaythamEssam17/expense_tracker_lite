import 'package:flutter/material.dart';

import '../factories/circular_indicator_factory.dart';

Future showWaitingDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: true, // Put it False to prevent user from back.
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          contentPadding: EdgeInsets.zero,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: PlatformCircularIndictor.buildCircular(context: context),
            ),
          ),
        ),
      );
    },
  );
}
