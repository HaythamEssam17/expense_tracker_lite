import 'package:expense_tracker_lite/core/factories/circular_indicator_factory.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../../data/models/balance_model.dart';

class BalanceCard extends StatelessWidget {
  final VoidCallback? onMoreTap;
  final Future<BalanceModel> future;

  const BalanceCard({super.key, required this.future, this.onMoreTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BalanceModel>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: PlatformCircularIndictor.buildCircular(context: context),
          );
        if (!snapshot.hasData) {
          return _buildCard(context: context, balanceModel: BalanceModel());
        }

        final balance = snapshot.data!;

        return _buildCard(context: context, balanceModel: balance);
      },
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required BalanceModel balanceModel,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
      margin: EdgeInsets.symmetric(horizontal: 16.sp),
      decoration: BoxDecoration(
        color: context.appColors.lightPrimaryColor,
        borderRadius: BorderRadius.circular(AppConstants.radius22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CommonText(
                    'Total Balance',
                    color: context.textColors.white,
                    fontFamily: Fonts.cairoBold,
                  ),
                  Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: context.appColors.bgWhite,
                    size: 16,
                  ),
                ],
              ),
              GestureDetector(
                onTap: onMoreTap,
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: context.appColors.bgWhite,
                  size: 30,
                ),
              ),
            ],
          ),

          /// Total Balance Value
          CommonText(
            '\$ ' + balanceModel.totalBalance.floor().toStringAsFixed(2),
            color: context.textColors.white,
            fontSize: 30,
            fontFamily: Fonts.cairoBold,
          ),
          getSpaceHeight(20),

          /// Income & Expense Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                context,
                icon: Icons.arrow_downward_rounded,
                title: "Income",
                value:
                    '\$ ' +
                    balanceModel.incomeBalance.floor().toStringAsFixed(2),
              ),
              _buildStatItem(
                context,
                icon: Icons.arrow_upward_rounded,
                title: "Expense",
                value:
                    '\$ ' +
                    balanceModel.expenseBalance.floor().toStringAsFixed(2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.sp),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff6183F9),
              ),
              child: Icon(icon, color: context.appColors.bgWhite, size: 16),
            ),
            getSpaceWidth(8),
            CommonText(
              title,
              color: context.textColors.lightGrey300,
              fontFamily: Fonts.cairoBold,
              fontSize: 16,
            ),
          ],
        ),
        CommonText(
          value,
          color: context.textColors.white,
          fontSize: 20,
          fontFamily: Fonts.cairoBold,
        ),
      ],
    );
  }
}
