import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_file_image_widget.dart';
import '../common_title_text.dart';

previewImage({
  required BuildContext context,
  required String imagePath,
  Function()? uploadMedia,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: CommonFileImageWidget(
        imagePath: imagePath,
        // width: SharedText.screenWidth,
        // height: SharedText.screenHeight * 0.75,
      ),
      insetPadding: EdgeInsets.zero,
      buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: CommonText('No', color: context.textColors.error),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);

            uploadMedia!();
          },
          child: const CommonText('Confirm', fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
