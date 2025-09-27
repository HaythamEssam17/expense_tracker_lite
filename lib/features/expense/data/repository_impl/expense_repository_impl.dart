import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/network/error_handling/custom_error.dart';
import 'package:expense_tracker_lite/core/services/hive/hive_service.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:expense_tracker_lite/features/expense/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

import '../ds/api_expense_ds.dart';
import '../ds/mock_expense_ds.dart';

@Injectable(as: IExpenseRepository)
class ExpenseRepositoryImpl implements IExpenseRepository {
  final MockRemoteDataSource _mockRemoteDataSource;
  final ApiExpenseDataSource _apiExpenseDataSource;
  final HiveServiceProvider _hiveServiceProvider = HiveServiceProvider.i;

  ExpenseRepositoryImpl(this._mockRemoteDataSource, this._apiExpenseDataSource);

  @override
  Future<Either<CustomError, List<ExpenseModel>>> getPaginationExpenses({
    required int page,
  }) async {
    // Check if local data is available
    final localExpenses = await _mockRemoteDataSource.getPaginationExpenses(
      page: page,
    );

    if (localExpenses.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 3));

      return right(localExpenses);
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
  Future<bool> saveExpenses(
    ExpenseModel expenses, {
    bool isExpense = false,
  }) async {
    return await _apiExpenseDataSource.addExpense(expenses).then((value) async {
      if (value.isRight() && value.getOrElse(() => false)) {
        await _hiveServiceProvider.insert(
          _hiveServiceProvider.expenseBox,
          expenses.toJson(),
        );
        // await addExpense(expenses);
        await addBalances(expenses.amount ?? 10.0, isExpense: isExpense);
        return true;
      } else {
        return false;
      }
    });
  }

  Future<void> addBalances(double amount, {bool isExpense = false}) async {
    var currentBalance = await _hiveServiceProvider.getByKey(
      _hiveServiceProvider.balancesBox,
      'main',
    );

    if (isExpense) {
      final absAmount = amount.abs();
      currentBalance['expenseBalance'] += absAmount;
      currentBalance['totalBalance'] -= absAmount;
    } else {
      currentBalance['incomeBalance'] += amount;
      currentBalance['totalBalance'] += amount;
    }

    await _hiveServiceProvider
        .insertWithKey(_hiveServiceProvider.balancesBox, "main", {
          "totalBalance": currentBalance['totalBalance'],
          "expenseBalance": currentBalance['expenseBalance'],
          "incomeBalance": currentBalance['incomeBalance'],
        });
  }
}
