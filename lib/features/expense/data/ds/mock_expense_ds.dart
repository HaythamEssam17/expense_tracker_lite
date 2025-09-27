import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/hive/hive_service.dart';

abstract class MockRemoteDataSource {
  Future<List<ExpenseModel>> fetchMockExpenses();
  Future<List<ExpenseModel>> getPaginationExpenses({required int page});
}

@Injectable(as: MockRemoteDataSource)
class MockRemoteDataSourceImpl implements MockRemoteDataSource {
  final HiveServiceProvider _hiveServiceProvider = HiveServiceProvider.i;

  @override
  Future<List<ExpenseModel>> fetchMockExpenses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [];
    // return List.generate(10, (i) {
    //   return ExpenseModel(
    //     id: i + 1,
    //     category: "Food ${i + 1}",
    //     amount: 20.0 + i,
    //     currency: "USD",
    //     usdAmount: 20.0 + i,
    //     date: DateTime.now().subtract(Duration(days: i)),
    //   );
    // });
  }

  @override
  Future<List<ExpenseModel>> getPaginationExpenses({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var list = await _hiveServiceProvider.getAllPagination<ExpenseModel>(
      _hiveServiceProvider.expenseBox,
      page: page,
      limit: 10,
    );
    List<ExpenseModel> expenses = list
        .map((e) => ExpenseModel.fromJson((e as Map).cast<String, dynamic>()))
        .toList();

    return expenses;
  }
}
