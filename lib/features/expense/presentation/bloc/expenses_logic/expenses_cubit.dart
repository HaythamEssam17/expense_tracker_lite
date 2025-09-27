import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/expense_model.dart';
import '../../../domain/usecases/expense_usecases.dart';

part 'expenses_states.dart';

@Injectable()
class ExpensesCubit extends Cubit<ExpensesStates> {
  ExpensesCubit(this._expenseUseCases) : super(ExpensesStateInit()) {
    scrollController.addListener(() {
      setupScrollController();
    });

    getExpensesList();
  }

  final ExpenseUseCases _expenseUseCases;

  ///pagination
  int page = 1;
  final ScrollController scrollController = ScrollController();
  List<ExpenseModel> expensesList = [];
  bool hasMoreData = false;

  Future onRefresh() async {
    await getExpensesList();
  }

  void setupScrollController() {
    if (scrollController.offset >
            scrollController.position.maxScrollExtent - 200 &&
        scrollController.offset <= scrollController.position.maxScrollExtent) {
      if (state is! ExpensesLoadingMoreDateState && hasMoreData) {
        whenScrollExpensePagination();
      }
    }
  }

  /// Pagination Function
  whenScrollExpensePagination() async {
    emit(ExpensesLoadingMoreDateState());

    page = page + 1;
    var result = await _expenseUseCases.getPaginationExpenses(page: page);
    result.fold(
      (error) => emit(ExpensesErrorMoreDateState(error.errorMassage!)),
      (expenseListData) {
        var tempList = expenseListData;
        hasMoreData = tempList.length == 10;
        expensesList.addAll(tempList);
        emit(ExpensesSuccessMoreDateState());
      },
    );
  }

  getExpensesList() async {
    emit(ExpensesLoadingState());
    page = 1;
    var result = await _expenseUseCases.getPaginationExpenses(page: page);
    result.fold((error) => emit(ExpensesErrorState(error.errorMassage!)), (
      notificationListData,
    ) {
      expensesList = notificationListData;
      hasMoreData = expensesList.length == 10;
      if (expensesList.isEmpty) {
        emit(ExpensesEmptyState());
      } else {
        emit(ExpensesSuccessState());
      }
    });
  }
}
