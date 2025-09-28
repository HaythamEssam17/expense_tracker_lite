import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/bloc/dashboard_expense_logic/dashboard_expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/icon_paths.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/common_empty_widget.dart';
import '../../../../core/widgets/common_error_widget.dart';
import '../../../../core/widgets/loaders/list_loader_widget.dart';
import '../widgets/expense_item.dart';

class DashboardExpenseListView extends StatelessWidget {
  final int takeCount;

  const DashboardExpenseListView({super.key, this.takeCount = 0});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardExpenseCubit, DashboardExpenseStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        final cubit = ctx.read<DashboardExpenseCubit>();

        if (state is DashboardExpenseFailed) {
          return CommonError(
            errorMassage: state.error,
            withButton: true,
            onTap: () => cubit.getLastCounted(),
          );
        } else if (state is DashboardExpenseLoading) {
          return ListLoaderWidget(
            itemCount: 10,
            itemHeight: getWidgetHeight(65),
            itemRadius: 16,
            padding: EdgeInsets.symmetric(
              vertical: getWidgetHeight(8),
              horizontal: getWidgetWidth(16),
            ),
          );
        } else if (state is DashboardExpensesEmpty) {
          return EmptyScreen(
            titleKey: 'No Expenses found',
            imageString: IconPath.emptyIcon,
            imageHeight: 125,
            imageWidth: 180,
          );
        } else {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: cubit.expensesList.length,
            separatorBuilder: (context, index) {
              return getSpaceHeight(4);
            },
            itemBuilder: (context, index) {
              final expense = cubit.expensesList[index];
              return ExpenseItem(expenseModel: expense);
            },
          );
        }
      },
    );
  }
}
