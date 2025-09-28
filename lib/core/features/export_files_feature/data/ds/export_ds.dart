import 'dart:io';

import 'package:csv/csv.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class ExpenseExportDataSource {
  Future<String> saveCsv(List<List<dynamic>> rows, String fileName);
  Future<String> savePdf(pw.Document pdf, String fileName);
}

@Injectable(as: ExpenseExportDataSource)
class ExpenseExportDataSourceImpl implements ExpenseExportDataSource {
  @override
  Future<String> saveCsv(List<List<dynamic>> rows, String fileName) async {
    final csv = const ListToCsvConverter().convert(rows);
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$fileName.csv");
    await file.writeAsString(csv);
    return file.path;
  }

  @override
  Future<String> savePdf(pw.Document pdf, String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$fileName.pdf");
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }
}
