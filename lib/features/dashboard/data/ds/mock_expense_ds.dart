import 'package:expense_tracker_lite/features/dashboard/data/models/expense_model.dart';
import 'package:injectable/injectable.dart';

abstract class MockRemoteDataSource {
  Future<List<ExpenseModel>> fetchMockExpenses();
}

@Injectable(as: MockRemoteDataSource)
class MockRemoteDataSourceImpl implements MockRemoteDataSource {
  @override
  Future<List<ExpenseModel>> fetchMockExpenses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.generate(10, (i) {
      return ExpenseModel(
        id: i + 1,
        category: "Food ${i + 1}",
        amount: 20.0 + i,
        currency: "USD",
        usdAmount: 20.0 + i,
        date: DateTime.now().subtract(Duration(days: i)),
      );
    });
  }
}
