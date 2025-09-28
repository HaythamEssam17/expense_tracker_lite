import 'package:injectable/injectable.dart';

import '../../../../../features/expense/data/models/expense_model.dart';
import '../repository/export_repository.dart';

@Injectable()
class ExportExpensesUseCases {
  final IExpenseExportRepository repository;
  ExportExpensesUseCases(this.repository);

  Future<String> exportToCsv(List<ExpenseModel> expenses) {
    return repository.exportToCsv(expenses);
  }

  Future<String> exportToPdf(List<ExpenseModel> expenses) {
    return repository.exportToPdf(expenses);
  }
}
