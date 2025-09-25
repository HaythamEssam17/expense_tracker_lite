import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../common_title_text.dart';

void showSnackBar({
  required BuildContext context,
  required String title,
  Color? color,
}) {
  final snackBar = SnackBar(
    content: CommonText(title, fontWeight: FontWeight.w700, maxLines: 2),
    backgroundColor: color ?? context.appColors.primaryColor,
    behavior: SnackBarBehavior.fixed,
    dismissDirection: DismissDirection.up,
    duration: const Duration(milliseconds: 2500),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
