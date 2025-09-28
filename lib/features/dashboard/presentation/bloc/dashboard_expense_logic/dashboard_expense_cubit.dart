import 'package:expense_tracker_lite/features/dashboard/data/models/balance_model.dart';
import 'package:expense_tracker_lite/features/dashboard/domain/usecases/dashboard_expense_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/constants/enums/date_filter.dart';
import '../../../../../core/services/hive/hive_service.dart';
import '../../../../expense/data/models/expense_model.dart';

part 'dashboard_expense_states.dart';

@Injectable()
class DashboardExpenseCubit extends Cubit<DashboardExpenseStates> {
  DashboardExpenseCubit(this._expenseUseCases) : super(DashboardExpenseInit()) {
    getLastCounted();
  }

  final DashboardExpenseUseCase _expenseUseCases;

  final HiveServiceProvider _hiveServiceProvider = HiveServiceProvider.i;

  List<ExpenseModel> expensesList = [];

  getLastCounted<T>({
    int take = 4,
    DateFilter? filter,
    DateTime Function(dynamic)? getDate,
  }) async {
    emit(DashboardExpenseLoading());

    var result = await _expenseUseCases.getLastCounted(
      take: take,
      filter: filter,
      getDate: getDate,
    );

    result.fold((error) => emit(DashboardExpenseFailed(error.errorMassage!)), (
      data,
    ) {
      if (getDate != null) {
        getBalances(getDate: getDate);
      }

      if (data.isEmpty) {
        emit(DashboardExpensesEmpty());
      } else {
        expensesList = data;

        emit(DashboardExpenseSuccess());
      }
    });
  }

  Future<BalanceModel> getBalances<T>({
    DateTime Function(dynamic)? getDate,
  }) async {
    var balances = await _hiveServiceProvider.getByKey(
      _hiveServiceProvider.balancesBox,
      "main",
      filter: DateFilter.all,
      getDate: getDate,
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
