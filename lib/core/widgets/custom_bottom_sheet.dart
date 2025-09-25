import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helpers/shared.dart';
import '../routers/app_route.dart';

void showBottomModalSheet({
  required BuildContext context,
  double? height,
  // required List<Widget> children,
  required Widget child,
  TextStyle? textStyle,
  Widget? widget,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.appColors.bgWhite,
    elevation: 0.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.radius14),
        topRight: Radius.circular(AppConstants.radius14),
      ),
    ),
    builder: (ctx) {
      return Container(
        height: height == null ? null : getWidgetHeight(height),
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        decoration: BoxDecoration(
          color: ctx.appColors.bgWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppConstants.radius14),
            topRight: Radius.circular(AppConstants.radius14),
          ),
        ),
        child: IntrinsicHeight(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              right: 16.sp,
              left: 16.sp,
              bottom: 16.sp + MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    widget ?? const SizedBox.shrink(),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        router.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.appColors.surfacesGray,
                        ),
                        child: Center(
                          child: Icon(Icons.close_rounded, size: 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                getSpaceHeight(16),
                // ...children,
                child,
              ],
            ),
          ),
        ),
      );
    },
  );
}
