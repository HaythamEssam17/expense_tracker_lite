import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/shared.dart';

abstract class BackArrowFactory {
  Widget buildArrow(BuildContext context);

  factory BackArrowFactory(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidArrow();
      case TargetPlatform.iOS:
        return IOSArrow();

      default:
        return AndroidArrow();
    }
  }
}

class AndroidArrow implements BackArrowFactory {
  @override
  Widget buildArrow(context) {
    return const Icon(Icons.arrow_back_outlined);
  }
}

class IOSArrow implements BackArrowFactory {
  @override
  Widget buildArrow(context) {
    return const Icon(CupertinoIcons.back);
  }
}

/// UI
class PlatformArrowIndictor {
  static Widget buildArrow({required BuildContext context}) {
    return Container(
      height: getWidgetHeight(48),
      width: getWidgetHeight(48),
      decoration: BoxDecoration(
        color: context.appColors.bgWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: BackArrowFactory(Theme.of(context).platform).buildArrow(context),
      ),
    );
  }
}
