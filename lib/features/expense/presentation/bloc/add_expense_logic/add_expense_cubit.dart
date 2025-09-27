import 'package:expense_tracker_lite/features/expense/data/models/category_model.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/forms/add_expense_form.dart';
import '../../../../../core/utils/forms/utils_shared_forms.dart';
import '../../../domain/usecases/expense_usecases.dart';

part 'add_expense_states.dart';

@Injectable()
class AddExpenseCubit extends Cubit<AddExpenseStates> {
  final ExpenseUseCases _expenseUseCases;

  AddExpenseForm addExpenseForm = Forms.addExpense;

  AddExpenseCubit(this._expenseUseCases) : super(AddExpenseInit()) {
    init();
  }

  init() {
    addExpenseForm.dateController.text = DateFormat(
      'MM/dd/yyyy',
    ).format(DateTime.now());
  }

  @override
  Future<void> close() {
    addExpenseForm.dispose();
    return super.close();
  }

  ExpenseModel expense = ExpenseModel();

  void setCategory(CategoryModel category) {
    addExpenseForm.categoryController.text = category.name!;
    expense.category = category.name;
    expense.iconColor = category.iconColor;
    expense.icon = category.icon;
    expense.bgColor = category.bgColor;
    emit(AddExpenseInit());
  }

  void setAmount(String value) {
    addExpenseForm.amountController.text = value;

    final removeComma = value.replaceAll(",", "");
    expense.amount = double.tryParse(removeComma) ?? 0;

    emit(AddExpenseInit());
  }

  void setDate(String value) {
    addExpenseForm.dateController.text = value;
    expense.date = DateTime.now();
    emit(AddExpenseInit());
  }

  void setAttachImage(String value) {
    addExpenseForm.receiptController.text = value;
    expense.receiptPath = value;
    emit(AddExpenseInit());
  }

  void saveExpense({bool isExpense = false}) async {
    if (addExpenseForm.formKey.currentState!.validate()) {
      emit(AddExpenseLoading());

      var result = await _expenseUseCases.saveExpenses(
        expense,
        isExpense: isExpense,
      );

      if (result) {
        emit(AddExpenseAddedSuccess());
      } else {
        emit(AddExpenseAddedFailed("Error: Failed to save expense"));
      }
    }
  }
}
