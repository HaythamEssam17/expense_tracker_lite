import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../constants/enums/exception_enums.dart';
import 'error_handling/custom_error.dart';
import 'error_handling/custom_exception.dart';

Future<Either<CustomError, T>> executeAndHandleError<T>(
  Future<T> Function() function,
) async {
  try {
    final T result = await function();
    return Right(result);
  } on DioException catch (ex) {
    return Left(
      CustomError(
        type: CustomStatusCodeErrorType.badRequest,
        errorMassage: ex.message,
      ),
    );
  } on CustomException catch (ex) {
    return Left(CustomError(type: ex.type, errorMassage: ex.errorMassage));
  }
}
