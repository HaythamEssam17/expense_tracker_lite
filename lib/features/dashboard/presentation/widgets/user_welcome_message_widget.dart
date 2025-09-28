import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/date_time_extension.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/core/widgets/custom_bottom_sheet.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/enums/date_filter.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/Images/common_cached_image_widget.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../../../auth/data/models/user_model.dart';
import '../bloc/dashboard_expense_logic/dashboard_expense_cubit.dart';

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
                  color: context.textColors.white,
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
          GestureDetector(
            onTap: () {
              final cubit = context.read<DashboardExpenseCubit>();

              showBottomModalSheet(
                context: context,
                child: Column(
                  children: [
                    _filterItem('All', () {
                      cubit.getLastCounted<ExpenseModel>(
                        filter: DateFilter.all,
                        getDate: (e) {
                          var date = e["date"] == null
                              ? DateTime.now()
                              : DateTime.parse(e["date"]);

                          return date;
                        },
                      );
                    }),
                    _filterItem('Today', () {
                      cubit.getLastCounted<ExpenseModel>(
                        filter: DateFilter.today,
                        getDate: (e) {
                          var date = e["date"] == null
                              ? DateTime.now()
                              : DateTime.parse(e["date"]);

                          return date;
                        },
                      );
                    }),
                    _filterItem('This week', () {
                      cubit.getLastCounted<ExpenseModel>(
                        filter: DateFilter.thisWeek,
                        getDate: (e) {
                          var date = e["date"] == null
                              ? DateTime.now()
                              : DateTime.parse(e["date"]);

                          return date;
                        },
                      );
                    }),
                    _filterItem('This month', () {
                      cubit.getLastCounted<ExpenseModel>(
                        filter: DateFilter.thisMonth,
                        getDate: (e) {
                          var date = e["date"] == null
                              ? DateTime.now()
                              : DateTime.parse(e["date"]);

                          return date;
                        },
                      );
                    }),
                  ],
                ),
              );
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }

  Widget _filterItem(String title, Function() onTap) {
    return ListTile(onTap: onTap, title: CommonText(title));
  }
}
