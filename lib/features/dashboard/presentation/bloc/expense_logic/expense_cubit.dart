import 'package:expense_tracker_lite/features/dashboard/data/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/expense_usecases.dart';

part 'expense_states.dart';

@Injectable()
class ExpenseCubit extends Cubit<ExpenseStates> {
  final ExpenseUseCases _expenseUseCases;
  final ScrollController scrollController = ScrollController();

  ExpenseCubit(this._expenseUseCases) : super(ExpenseStates()) {
    // Init
    loadExpenses(page: 1);

    // Attach scroll listener
    scrollController.addListener(_onScroll);
  }

  int currentPage = 1;
  final int limit = 10;
  bool isFetching = false;

  List<ExpenseModel> expenses = [];

  Future<void> loadExpenses({required int page}) async {
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
        loadExpenses(page: currentPage + 1);
      }
    }
  }

  // @override
  // Future<void> close() {
  //   scrollController.dispose();
  //   return super.close();
  // }
  //
  //
  // List<ExpenseModel> expenses = [];
  // final ScrollController scrollController = ScrollController();
  //
  // int currentPage = 1;
  // final int limit = 10;
  // bool isLoadingMore = false;
  //
  // Future<void> loadExpenses({required int page}) async {
  //   if (isLoadingMore) return;
  //
  //   if (page == 1) {
  //     emit(ExpenseLoading());
  //   } else {
  //     isLoadingMore = true;
  //   }
  //
  //   try {
  //     final result = await _expenseUseCases.fetchExpenses(
  //       page: page,
  //       limit: limit,
  //     );
  //
  //     if (page == 1) expenses.clear();
  //
  //     result.fold(
  //       (l) {
  //         emit(ExpenseFailed("Error: ${l.errorMassage!}"));
  //       },
  //       (r) {
  //         if (r.isEmpty) {
  //           emit(ExpenseSuccess(expenses: expenses, hasMore: false));
  //         } else {
  //           expenses.addAll(r);
  //           currentPage = page;
  //           emit(ExpenseSuccess(expenses: expenses, hasMore: true));
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     emit(ExpenseFailed("Error: $e"));
  //   } finally {
  //     isLoadingMore = false;
  //   }
  // }
  //
  // void _onScroll() {
  //   if (scrollController.position.pixels >=
  //       scrollController.position.maxScrollExtent - 200) {
  //     if (state is ExpenseSuccess && (state as ExpenseSuccess).hasMore) {
  //       loadExpenses(page: currentPage + 1);
  //     }
  //   }
  // }
}
