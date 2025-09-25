import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/enums/exception_enums.dart';
import '../constants/local_keys.dart';
import '../local_storage/secure_storage_impl.dart';
import 'error_handling/custom_exception.dart';
import 'error_handling/dio_exception.dart';

class DioHelper {
  final Dio dio;

  DioHelper(this.dio);

  Future<Response> getData({required String url}) async {
    try {
      return await dio.get(url);
    } on DioException catch (exception) {
      final CustomStatusCodeErrorType errorType = DioExceptions.fromDioError(
        exception,
      ).errorType;
      String errorMessage = '';
      if (DioExceptions.fromDioError(exception).errorMassage.isEmpty) {
        errorMessage = exception.response?.data["message"] ?? exception.message;
      } else {
        errorMessage = DioExceptions.fromDioError(exception).errorMassage;
      }

      /// throw custom exception
      throw CustomException(errorType, 'error.png', errorMassage: errorMessage);
    } catch (e) {
      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }

  Future<Response> postData({
    required String url,
    required dynamic data,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      return response;
    } on DioException catch (exception) {
      /// Get custom massage for the exception
      final errorType = DioExceptions.fromDioError(exception).errorType;

      final errorMessage = DioExceptions.fromDioError(exception).errorMassage;

      /// throw custom exception
      throw CustomException(errorType, 'error.png', errorMassage: errorMessage);
    } catch (error) {
      throw CustomException(CustomStatusCodeErrorType.unExcepted, 'error.png');
    }
  }

  Future<bool> refreshToken() async {
    try {
      final refreshToken = await SecureStorageService().get(
        LocalKeys.refreshTokenKey,
      );
      if (refreshToken == null) return false;

      final response = await dio.post(
        dotenv.get('google_url'),
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'apikey': dotenv.get('get_key')}),
      );

      final accessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      if (accessToken != null && newRefreshToken != null) {
        await SecureStorageService().save(
          LocalKeys.bearerTokenKey,
          accessToken,
        );
        await SecureStorageService().save(
          LocalKeys.refreshTokenKey,
          newRefreshToken,
        );
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
