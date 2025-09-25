import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/network/dio_base_execute.dart';
import 'package:expense_tracker_lite/core/network/error_handling/custom_error.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:injectable/injectable.dart';

abstract class ApiExpenseDataSource {
  Future<Either<CustomError, List<Map<String, dynamic>>>> fetchExpenses();
  Future<Either<CustomError, bool>> addExpense(ExpenseModel expense);
}

@Injectable(as: ApiExpenseDataSource)
class ApiExpenseDataSourceImpl implements ApiExpenseDataSource {
  @override
  Future<Either<CustomError, List<Map<String, dynamic>>>>
  fetchExpenses() async {
    return executeAndHandleError(() async {
      /*

      String url = dotenv.get('api_url');
      var dioHelper = getIt<DioHelper>();

      var response = await dioHelper.getData(url: url);
      return response.data;

      */

      await Future.delayed(const Duration(seconds: 3));
      return [];
    });
  }

  @override
  Future<Either<CustomError, bool>> addExpense(ExpenseModel expense) async {
    return executeAndHandleError(() async {
      /*

      String url = dotenv.get('api_url');
      var dioHelper = getIt<DioHelper>();

      var response = await dioHelper.postData(url: url, data: expense.toJson());
      return response.data;

      */

      await Future.delayed(const Duration(seconds: 3));
      return true;
    });
  }
}
