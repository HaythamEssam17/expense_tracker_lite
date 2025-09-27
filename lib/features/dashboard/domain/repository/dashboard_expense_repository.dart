import 'package:dartz/dartz.dart';

import '../../../../core/network/error_handling/custom_error.dart';
import '../../../expense/data/models/expense_model.dart';

abstract class IDashboardExpenseRepository {
  Future<Either<CustomError, List<ExpenseModel>>> getLastCounted();
}
