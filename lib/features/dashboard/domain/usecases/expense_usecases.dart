import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/features/dashboard/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/error_handling/custom_error.dart';
import '../../data/models/expense_model.dart';

@Injectable()
class ExpenseUseCases {
  final IExpenseRepository _expenseRepository;

  ExpenseUseCases(this._expenseRepository);

  Future<Either<CustomError, List<ExpenseModel>>> fetchExpenses({
    int page = 1,
    int limit = 10,
  }) async {
    return await _expenseRepository.fetchExpenses(page: 1, limit: 10);
  }

  Future<bool> saveExpenses(ExpenseModel expenses) async {
    return _expenseRepository.saveExpenses(expenses);
  }
}
