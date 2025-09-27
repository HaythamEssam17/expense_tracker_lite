import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/network/error_handling/custom_error.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/dashboard_expense_repository.dart';
import '../ds/mock_dashboard_expense_ds.dart';

@Injectable(as: IDashboardExpenseRepository)
class DashboardExpenseRepositoryImpl implements IDashboardExpenseRepository {
  final MockDashboardExpenseDatsSource _mockRemoteDataSource;

  DashboardExpenseRepositoryImpl(this._mockRemoteDataSource);

  @override
  Future<Either<CustomError, List<ExpenseModel>>> getLastCounted() async {
    final result = await _mockRemoteDataSource.getLastCounted();

    return right(result);
  }
}
