import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/network/error_handling/custom_error.dart';
import 'package:expense_tracker_lite/core/services/hive/hive_service.dart';
import 'package:expense_tracker_lite/features/dashboard/data/models/expense_model.dart';
import 'package:expense_tracker_lite/features/dashboard/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

import '../ds/api_expense_ds.dart';
import '../ds/mock_expense_ds.dart';

@Injectable(as: IExpenseRepository)
class ExpenseRepository implements IExpenseRepository {
  final MockRemoteDataSource _mockRemoteDataSource;
  final ApiExpenseDataSource _apiExpenseDataSource;
  final HiveServiceProvider _hiveServiceProvider = HiveServiceProvider.i;

  ExpenseRepository(this._mockRemoteDataSource, this._apiExpenseDataSource);

  @override
  Future<Either<CustomError, List<ExpenseModel>>> fetchExpenses({
    int page = 1,
    int limit = 10,
  }) async {
    // Check if local data is available
    final localExpenses = await _hiveServiceProvider
        .getAllPagination<ExpenseModel>(
          _hiveServiceProvider.expenseBox,
          page: page,
          limit: limit,
        );

    if (localExpenses.isNotEmpty) {
      // Handle pagination
      List<ExpenseModel> expenses = localExpenses
          .map((e) => ExpenseModel.fromJson((e as Map).cast<String, dynamic>()))
          .toList();

      return right(expenses);
    } else {
      final result = await _apiExpenseDataSource.fetchExpenses();

      // Handle error
      if (result.isLeft()) {
        return left(
          result.swap().getOrElse(
            () => CustomError(errorMassage: 'Failed to fetch remote expenses'),
          ),
        );
      }

      // Handle success api call
      final r = result.getOrElse(() => []);

      // handle mock data
      List<ExpenseModel> remoteExpenses = [];

      if (r.isEmpty) {
        remoteExpenses = await _mockRemoteDataSource.fetchMockExpenses();
      } else {
        remoteExpenses = r.map((e) => ExpenseModel.fromJson(e)).toList();
      }

      for (var i in remoteExpenses) {
        await _hiveServiceProvider.insertWithKey(
          _hiveServiceProvider.expenseBox,
          i.id,
          i.toJson(),
        );
      }

      return right(remoteExpenses);
    }
  }

  @override
  Future<bool> saveExpenses(ExpenseModel expenses) async {
    return await _apiExpenseDataSource.addExpense(expenses).then((value) async {
      if (value.isRight() && value.getOrElse(() => false)) {
        await _hiveServiceProvider.insertWithKey(
          _hiveServiceProvider.expenseBox,
          expenses.id,
          expenses.toJson(),
        );
        return true;
      } else {
        return false;
      }
    });

    // return await _hiveServiceProvider.insertWithKey(
    //   _hiveServiceProvider.expenseBox,
    //   expenses.id,
    //   expenses.toJson(),
    // );
  }
}
