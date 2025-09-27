import 'package:expense_tracker_lite/core/constants/icon_paths.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/date_time_extension.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/string_extensions.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/Images/common_asset_svg_image_widget.dart';
import '../../../../core/widgets/common_title_text.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenseModel});

  final ExpenseModel expenseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      margin: EdgeInsets.only(bottom: 8.sp),
      decoration: BoxDecoration(
        color: context.appColors.bgWhite,
        borderRadius: BorderRadius.circular(AppConstants.radius10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 8),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: expenseModel.bgColor?.toColor() ?? Colors.red,
              child: CommonAssetSvgImageWidget(
                imageString: expenseModel.icon ?? IconPath.rentIcon,
                height: 20,
                width: 20,
                imageColor: expenseModel.iconColor?.toColor(),
              ),
            ),
            getSpaceWidth(8.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    expenseModel.category!,
                    fontSize: 16,
                    fontFamily: Fonts.cairoBold,
                  ),
                  // getSpaceHeight(8),
                  const Spacer(),
                  CommonText(
                    'Manually',
                    fontSize: 12,
                    fontFamily: Fonts.cairoSemiBold,
                    color: context.textColors.light,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonText(
                  '- \$${expenseModel.amount}',
                  fontSize: 16,
                  fontFamily: Fonts.cairoSemiBold,
                ),
                // getSpaceHeight(8),
                const Spacer(),
                CommonText(
                  (expenseModel.date ?? DateTime.now()).toFriendlyString(),
                  fontSize: 12,
                  fontFamily: Fonts.cairoSemiBold,
                  color: context.textColors.light,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
