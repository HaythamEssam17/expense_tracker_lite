import 'package:expense_tracker_lite/core/widgets/common_title_text.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/factories/circular_indicator_factory.dart';
import '../bloc/expense_logic/expense_cubit.dart';

class ExpenseListView extends StatelessWidget {
  final int takeCount;

  const ExpenseListView({super.key, this.takeCount = 0});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseStates>(
      builder: (context, state) {
        if (state is ExpenseLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExpenseSuccess) {
          if (state.expenses.isEmpty) {
            return const Center(child: CommonText('Empty list'));
          }

          return ListView.builder(
            controller: context.read<ExpenseCubit>().scrollController,
            itemCount: takeCount == 0
                ? (state.expenses.length + (state.hasMore ? 1 : 0))
                : takeCount,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              if (index < state.expenses.length) {
                final expense = state.expenses[index];
                return ExpenseItem(expenseModel: expense);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: PlatformCircularIndictor.buildCircular(
                    context: context,
                  ),
                );
              }
            },
          );
        } else if (state is ExpenseFailed) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}
