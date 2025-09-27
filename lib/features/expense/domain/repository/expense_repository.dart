import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/network/error_handling/custom_error.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';

abstract class IExpenseRepository {
  Future<bool> saveExpenses(ExpenseModel expenses, {bool isExpense = false});

  Future<Either<CustomError, List<ExpenseModel>>> getPaginationExpenses({
    required int page,
  });
}
