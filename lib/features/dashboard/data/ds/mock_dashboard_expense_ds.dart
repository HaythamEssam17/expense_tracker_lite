import 'package:injectable/injectable.dart';

import '../../../../core/services/hive/hive_service.dart';
import '../../../expense/data/models/expense_model.dart';

abstract class MockDashboardExpenseDatsSource {
  Future<List<ExpenseModel>> getLastCounted();
}

@Injectable(as: MockDashboardExpenseDatsSource)
class MockDashboardExpenseDatsSourceImpl
    implements MockDashboardExpenseDatsSource {
  final HiveServiceProvider _hiveServiceProvider = HiveServiceProvider.i;

  @override
  Future<List<ExpenseModel>> getLastCounted() async {
    await Future.delayed(const Duration(milliseconds: 500));
    var list = await _hiveServiceProvider.getLastCounted<ExpenseModel>(
      _hiveServiceProvider.expenseBox,
      4,
    );
    List<ExpenseModel> expenses = list
        .map((e) => ExpenseModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    return expenses;
  }
}
