import 'package:injectable/injectable.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../../features/expense/data/models/expense_model.dart';
import '../../domain/repository/export_repository.dart';
import '../ds/export_ds.dart';

@Injectable(as: IExpenseExportRepository)
class ExpenseExportRepositoryImpl implements IExpenseExportRepository {
  final ExpenseExportDataSource service;
  ExpenseExportRepositoryImpl(this.service);

  @override
  Future<String> exportToCsv(List<ExpenseModel> expenses) async {
    final rows = [
      ["Category", "Amount", "Date"],
      ...expenses.map(
        (e) => [
          e.category,
          e.amount,
          (e.date ?? DateTime.now()).toIso8601String(),
        ],
      ),
    ];
    return service.saveCsv(rows, "expenses");
  }

  @override
  Future<String> exportToPdf(List<ExpenseModel> expenses) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Table.fromTextArray(
          headers: ["Category", "Amount", "Date"],
          data: expenses
              .map(
                (e) => [
                  e.category,
                  e.amount.toString(),
                  (e.date ?? DateTime.now()).toIso8601String(),
                ],
              )
              .toList(),
        ),
      ),
    );
    return service.savePdf(pdf, "expenses");
  }
}
