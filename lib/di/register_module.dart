import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/dio_client.dart';
import '../core/constants/local_keys.dart';
import '../core/local_storage/secure_storage_impl.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get('exchange_api'),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageService().get(
            LocalKeys.bearerTokenKey,
          );
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Response: ${response.statusCode} ${response.data}");
          return handler.next(response);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            final refreshed = await DioHelper(dio).refreshToken();
            if (refreshed) {
              final token = await SecureStorageService().get(
                LocalKeys.bearerTokenKey,
              );
              e.requestOptions.headers['Authorization'] = 'Bearer $token';
              final cloneReq = await dio.fetch(e.requestOptions);
              return handler.resolve(cloneReq);
            } else {
              await SecureStorageService().clearAll();
            }
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  }

  @lazySingleton
  DioHelper dioHelper(Dio dio) => DioHelper(dio);
}
