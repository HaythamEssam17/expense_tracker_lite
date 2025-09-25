import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/date_time_extension.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/Images/common_cached_image_widget.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../../../auth/data/models/user_model.dart';

class UserWelcomeMessageWidget extends StatelessWidget {
  const UserWelcomeMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getWidgetHeight(48),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonCachedImageWidget(
            width: 48,
            height: 48,
            radius: 100,
            imageUrl: UserModel.userModel.image,
          ),
          getSpaceWidth(8.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  DateTime.now().greeting,
                  color: context.textColors.lightGrey,
                ),
                const Spacer(),
                CommonText(
                  UserModel.userModel.name!,
                  color: context.textColors.white,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          getSpaceWidth(8.sp),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
            decoration: BoxDecoration(
              color: context.appColors.bgWhite,
              borderRadius: BorderRadius.circular(AppConstants.radius10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonText('This month'),
                getSpaceWidth(8),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: context.appColors.grey58,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
