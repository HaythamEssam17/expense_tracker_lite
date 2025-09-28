import '../../../../../features/expense/data/models/expense_model.dart';

abstract class IExpenseExportRepository {
  Future<String> exportToCsv(List<ExpenseModel> expenses);
  Future<String> exportToPdf(List<ExpenseModel> expenses);
}
