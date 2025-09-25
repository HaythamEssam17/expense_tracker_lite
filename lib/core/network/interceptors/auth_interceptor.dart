// import 'package:dio/dio.dart';
// import 'package:clean_arch_annotations/features/auth_feature/data/repository/auth_repository.dart';
//
//
// class AuthInterceptor extends Interceptor {
//   final AuthRepository repository;
//   final Dio dio;
//
//   AuthInterceptor(this.repository, this.dio);
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       final refreshToken = await repository.local.getRefreshToken();
//       if (refreshToken != null) {
//         try {
//           final res = await repository.remote.refresh(refreshToken);
//           await repository.local.saveTokens(
//             res.accessToken!,
//             res.refreshToken!,
//           );
//
//           // Retry the original request with new token
//           final retryReq = await dio.request(
//             err.requestOptions.path,
//             options: Options(
//               method: err.requestOptions.method,
//               headers: {'Authorization': 'Bearer ${res.accessToken}'},
//             ),
//             data: err.requestOptions.data,
//             queryParameters: err.requestOptions.queryParameters,
//           );
//           return handler.resolve(retryReq);
//         } catch (_) {
//           await repository.logout();
//         }
//       }
//     }
//     return handler.next(err);
//   }
// }
