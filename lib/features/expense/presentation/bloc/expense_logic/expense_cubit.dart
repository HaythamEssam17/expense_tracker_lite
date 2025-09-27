import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/forms/add_expense_form.dart';
import '../../../../../core/utils/forms/utils_shared_forms.dart';
import '../../../domain/usecases/expense_usecases.dart';

part 'expense_states.dart';

@Injectable()
class ExpenseCubit extends Cubit<ExpenseStates> {
  final ExpenseUseCases _expenseUseCases;
  final ScrollController scrollController = ScrollController();

  AddExpenseForm addExpenseForm = Forms.addExpense;

  ExpenseCubit(this._expenseUseCases) : super(ExpenseInit()) {
    // Init
    loadExpenses();

    scrollController.addListener(_onScroll);
  }

  @override
  Future<void> close() {
    addExpenseForm.dispose();
    return super.close();
  }

  int currentPage = 1;
  final int limit = 10;
  bool isFetching = false;

  List<ExpenseModel> expenses = [];
  ExpenseModel expense = ExpenseModel();

  void setCategory(String value) {
    addExpenseForm.categoryController.text = value;
    expense.category = value;
    emit(ExpenseInit());
  }

  void setAmount(String value) {
    addExpenseForm.amountController.text = value;
    expense.amount = 1000;
    emit(ExpenseInit());
  }

  void setDate(String value) {
    addExpenseForm.dateController.text = value;
    expense.date = DateTime.now();
    emit(ExpenseInit());
  }

  void setAttachImage(String value) {
    addExpenseForm.receiptController.text = value;
    expense.receiptPath = value;
    emit(ExpenseInit());
  }

  Future<void> loadExpenses() async {
    expenses.clear();
    emit(ExpenseLoading());

    try {
      final result = await _expenseUseCases.fetchExpenses();

      result.fold(
        (l) {
          emit(ExpenseFailed("Error: ${l.errorMassage!}"));
        },
        (r) {
          expenses = r;
          emit(
            ExpenseSuccess(
              expenses: expenses,
              hasMore: false,
              isLoadingMore: false,
            ),
          );
        },
      );
    } catch (e) {
      emit(ExpenseFailed("Error: $e"));
    } finally {
      isFetching = false;
    }
  }

  Future<void> loadPaginatedExpenses({required int page}) async {
    if (isFetching) return;
    isFetching = true;

    if (page == 1) {
      emit(ExpenseLoading());
    } else {
      if (state is ExpenseSuccess) {
        emit((state as ExpenseSuccess).copyWith(isLoadingMore: true));
      }
    }

    try {
      final result = await _expenseUseCases.fetchExpenses(
        page: page,
        limit: limit,
      );

      if (page == 1) expenses.clear();

      result.fold(
        (l) {
          emit(ExpenseFailed("Error: ${l.errorMassage!}"));
        },
        (r) {
          if (r.isEmpty) {
            emit(
              ExpenseSuccess(
                expenses: expenses,
                hasMore: false,
                isLoadingMore: false,
              ),
            );
          } else {
            expenses.addAll(r);
            currentPage = page;
            emit(
              ExpenseSuccess(
                expenses: expenses,
                hasMore: true,
                isLoadingMore: false,
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(ExpenseFailed("Error: $e"));
    } finally {
      isFetching = false;
    }
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (state is ExpenseSuccess &&
          (state as ExpenseSuccess).hasMore &&
          !(state as ExpenseSuccess).isLoadingMore) {
        loadPaginatedExpenses(page: currentPage + 1);
      }
    }
  }

  void saveExpense() async {
    if (addExpenseForm.formKey.currentState!.validate()) {
      emit(ExpenseLoading());

      var result = await _expenseUseCases.saveExpenses(expense);

      if (result) {
        emit(ExpenseAddedSuccess());
      } else {
        emit(ExpenseAddedFailed("Error: Failed to save expense"));
      }
    }
  }
}
