import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/features/expense/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/error_handling/custom_error.dart';
import '../../data/models/expense_model.dart';

@Injectable()
class ExpenseUseCases {
  final IExpenseRepository _expenseRepository;

  ExpenseUseCases(this._expenseRepository);

  Future<bool> saveExpenses(
    ExpenseModel expenses, {
    bool isExpense = false,
  }) async {
    return _expenseRepository.saveExpenses(expenses, isExpense: isExpense);
  }

  Future<Either<CustomError, List<ExpenseModel>>> getPaginationExpenses({
    required int page,
  }) async {
    return await _expenseRepository.getPaginationExpenses(page: page);
  }
}
