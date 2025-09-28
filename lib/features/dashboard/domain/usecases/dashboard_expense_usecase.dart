import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/features/dashboard/domain/repository/dashboard_expense_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/date_filter.dart';
import '../../../../core/network/error_handling/custom_error.dart';
import '../../../../core/services/hive/hive_service.dart';
import '../../../expense/data/models/expense_model.dart';

@Injectable()
class DashboardExpenseUseCase {
  final IDashboardExpenseRepository _dashboardExpenseRepository;
  final HiveServiceProvider hiveServiceProvider = HiveServiceProvider.i;

  DashboardExpenseUseCase(this._dashboardExpenseRepository);

  Future<Either<CustomError, List<ExpenseModel>>> getLastCounted({
    int take = 4,
    DateFilter? filter,
    DateTime Function(dynamic)? getDate,
  }) async {
    return await _dashboardExpenseRepository.getLastCounted(
      take: take,
      filter: filter,
      getDate: getDate,
    );
  }
}
