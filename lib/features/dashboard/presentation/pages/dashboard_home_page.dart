import 'package:expense_tracker_lite/core/app/app_scaffold_page.dart';
import 'package:expense_tracker_lite/core/constants/app_constants.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/shared.dart';
import 'package:expense_tracker_lite/core/helpers/shared_texts.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/bloc/dashboard_expense_logic/dashboard_expense_cubit.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/widgets/title_see_more_widget.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/widgets/user_welcome_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/balance_widget.dart';
import 'dashboard_expense_list_view.dart';

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
              height: SharedText.screenHeight * 0.4,
              width: SharedText.screenWidth,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: const TitleSeeMoreWidget(),
                    ),
                    const Expanded(
                      child: DashboardExpenseListView(takeCount: 4),
                    ),
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
          BlocBuilder<DashboardExpenseCubit, DashboardExpenseStates>(
            builder: (context, state) {
              if (state is DashboardExpenseLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final cubit = context.read<DashboardExpenseCubit>();

              return Positioned(
                top: 150.sp,
                left: 0,
                right: 0,
                child: BalanceCard(
                  future: cubit.getBalances(),
                  onMoreTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
