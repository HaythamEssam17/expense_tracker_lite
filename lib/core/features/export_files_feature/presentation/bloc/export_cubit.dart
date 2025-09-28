import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../features/expense/data/models/expense_model.dart';
import '../../domain/usecase/export_usecase.dart';

part 'export_states.dart';

@Injectable()
class ExportCubit extends Cubit<ExportState> {
  final ExportExpensesUseCases exportUseCase;

  ExportCubit({required this.exportUseCase}) : super(ExportState());

  Future<void> exportAsCsv(List<ExpenseModel> expenses) async {
    emit(ExportState(isLoading: true));
    try {
      final path = await exportUseCase.exportToCsv(expenses);
      emit(ExportState(filePath: path));
    } catch (e) {
      emit(ExportState(error: e.toString()));
    }
  }

  Future<void> exportAsPdf(List<ExpenseModel> expenses) async {
    emit(ExportState(isLoading: true));
    try {
      final path = await exportUseCase.exportToPdf(expenses);
      emit(ExportState(filePath: path));
    } catch (e) {
      emit(ExportState(error: e.toString()));
    }
  }
}
