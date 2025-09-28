import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/date_filter.dart';
import '../../../../core/services/hive/hive_service.dart';
import '../../../expense/data/models/expense_model.dart';

abstract class MockDashboardExpenseDatsSource {
  Future<List<ExpenseModel>> getLastCounted({
    int take = 4,
    DateFilter? filter,
    DateTime Function(dynamic)? getDate,
  });
}

@Injectable(as: MockDashboardExpenseDatsSource)
class MockDashboardExpenseDatsSourceImpl
    implements MockDashboardExpenseDatsSource {
  final HiveServiceProvider _hiveServiceProvider = HiveServiceProvider.i;

  @override
  Future<List<ExpenseModel>> getLastCounted({
    int take = 4,
    DateFilter? filter,
    DateTime Function(dynamic)? getDate,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var list = await _hiveServiceProvider.getLastCounted<ExpenseModel>(
      _hiveServiceProvider.expenseBox,
      4,
      filter: filter,
      getDate: getDate,
    );
    List<ExpenseModel> expenses = list
        .map((e) => ExpenseModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    return expenses;
  }
}
