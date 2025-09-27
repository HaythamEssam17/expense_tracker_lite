part of 'expense_cubit.dart';

@Injectable()
class ExpenseStates {}

class ExpenseInit extends ExpenseStates {}

class ExpenseLoading extends ExpenseStates {}

class ExpenseAddedSuccess extends ExpenseStates {}

class ExpenseAddedFailed extends ExpenseStates {
  final String errorMessage;
  ExpenseAddedFailed(this.errorMessage);
}

class ExpenseSuccess extends ExpenseStates {
  final List<ExpenseModel> expenses;
  final bool hasMore;
  final bool isLoadingMore;

  ExpenseSuccess({
    required this.expenses,
    required this.hasMore,
    required this.isLoadingMore,
  });

  ExpenseSuccess copyWith({
    List<ExpenseModel>? expenses,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return ExpenseSuccess(
      expenses: expenses ?? this.expenses,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class ExpenseFailed extends ExpenseStates {
  final String errorMessage;
  ExpenseFailed(this.errorMessage);
}
