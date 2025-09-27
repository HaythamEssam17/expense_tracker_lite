import 'package:expense_tracker_lite/features/dashboard/data/models/balance_model.dart';
import 'package:expense_tracker_lite/features/dashboard/domain/usecases/dashboard_expense_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/hive/hive_service.dart';
import '../../../../expense/data/models/expense_model.dart';

part 'dashboard_expense_states.dart';

@Injectable()
class DashboardExpenseCubit extends Cubit<DashboardExpenseStates> {
  DashboardExpenseCubit(this._expenseUseCases) : super(DashboardExpenseInit()) {
    getExpensesList();
  }

  final DashboardExpenseUseCase _expenseUseCases;

  List<ExpenseModel> expensesList = [];

  getExpensesList() async {
    emit(DashboardExpenseLoading());

    var result = await _expenseUseCases.getLastCounted();

    result.fold((error) => emit(DashboardExpenseFailed(error.errorMassage!)), (
      data,
    ) {
      if (data.isEmpty) {
        emit(DashboardExpensesEmpty());
      } else {
        expensesList = data;

        emit(DashboardExpenseSuccess());
      }
    });
  }

  final HiveServiceProvider _hiveServiceProvider = HiveServiceProvider.i;
  Future<BalanceModel> getBalances() async {
    var balances = await _hiveServiceProvider.getByKey(
      _hiveServiceProvider.balancesBox,
      "main",
    );
    Map<String, dynamic> map = {
      "totalBalance": balances['totalBalance'],
      "incomeBalance": balances['incomeBalance'],
      "expenseBalance": balances['expenseBalance'],
    };

    var model = BalanceModel.fromJson(map);

    return model;
  }
}
