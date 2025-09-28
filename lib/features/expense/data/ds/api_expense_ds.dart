import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/network/dio_base_execute.dart';
import 'package:expense_tracker_lite/core/network/dio_client.dart';
import 'package:expense_tracker_lite/core/network/error_handling/custom_error.dart';
import 'package:expense_tracker_lite/di/injection.dart';
import 'package:expense_tracker_lite/features/expense/data/models/expense_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

abstract class ApiExpenseDataSource {
  Future<Either<CustomError, List<Map<String, dynamic>>>> fetchExpenses();
  Future<Either<CustomError, bool>> addExpense(ExpenseModel expense);
  Future<double?> getExchangeRate(String currencyCode);
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
      await Future.delayed(const Duration(seconds: 3));
      return true;
    });
  }

  @override
  Future<double?> getExchangeRate(String currencyCode) async {
    try {
      final url = dotenv.get('exchange_api');
      final dio = getIt<DioHelper>();

      final response = await dio.getData(url: url);

      if (response.statusCode == 200) {
        final data = response.data;
        final rates = data['rates'];

        if (rates != null && rates[currencyCode] != null) {
          return rates[currencyCode] * 1.0; // convert to double
        }
      }
    } catch (e) {
      print("Error fetching exchange rate: $e");
    }
    return null; // null يعني مفيش rate
  }
}
