import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/features/dashboard/data/models/expense_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
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
            offset: const Offset(0, 1),
            blurRadius: 5,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            const CircleAvatar(),
            getSpaceWidth(8.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    'Groceries',
                    fontSize: 16,
                    fontFamily: Fonts.elMessiriBold,
                  ),
                  // getSpaceHeight(8),
                  const Spacer(),
                  CommonText(
                    'Manually',
                    fontSize: 12,
                    fontFamily: Fonts.elMessiriSemiBold,
                    color: context.textColors.light,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonText(
                  '- \$100',
                  fontSize: 16,
                  fontFamily: Fonts.elMessiriBold,
                ),
                // getSpaceHeight(8),
                const Spacer(),
                CommonText(
                  'Today 12:00 AM',
                  fontSize: 12,
                  fontFamily: Fonts.elMessiriSemiBold,
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
