import 'package:expense_tracker_lite/core/app/app_scaffold_page.dart';
import 'package:expense_tracker_lite/core/constants/app_constants.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/shared.dart';
import 'package:expense_tracker_lite/core/helpers/shared_texts.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/widgets/title_see_more_widget.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/widgets/user_welcome_message_widget.dart';
import 'package:expense_tracker_lite/features/expense/presentation/pages/expense_list_view.dart';
import 'package:flutter/material.dart';

import '../widgets/balance_widget.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: SharedText.screenHeight * 0.45,
              width: SharedText.screenWidth,
              child: Container(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleSeeMoreWidget(),
                    getSpaceHeight(16),
                    const Expanded(child: ExpenseListView(takeCount: 4)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: SharedText.screenHeight * 0.35,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              decoration: BoxDecoration(
                color: context.appColors.primaryColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(AppConstants.radius10),
                  right: Radius.circular(AppConstants.radius10),
                ),
              ),
              child: Column(
                children: [
                  getSpaceHeight(kToolbarHeight),
                  const UserWelcomeMessageWidget(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150.sp,
            left: 0,
            right: 0,
            child: BalanceCard(
              totalBalance: "\$ 2,458.00",
              income: "\$ 1,800.00",
              expense: "\$ 658.00",
              onMoreTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
