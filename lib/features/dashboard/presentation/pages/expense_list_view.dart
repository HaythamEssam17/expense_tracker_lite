import 'package:expense_tracker_lite/features/dashboard/presentation/bloc/expense_logic/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseStates>(
      builder: (context, state) {
        if (state is ExpenseLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExpenseSuccess) {
          return ListView.builder(
            controller: context.read<ExpenseCubit>().scrollController,
            itemCount: state.expenses.length + 1,
            itemBuilder: (context, index) {
              if (index < state.expenses.length) {
                final expense = state.expenses[index];
                return ListTile(
                  title: Text(expense.category!),
                  subtitle: Text("${expense.amount} ${expense.currency}"),
                );
              } else {
                return state.hasMore
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink();
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
