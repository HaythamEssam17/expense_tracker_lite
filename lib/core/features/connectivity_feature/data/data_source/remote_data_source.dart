import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../di/injection.dart';
import '../../../../network/dio_client.dart';

abstract class ConnectivityRemoteDataSourceInterface {
  Future<bool> checkConnection();
}

class ConnectivityRemoteDataSourceImp
    extends ConnectivityRemoteDataSourceInterface {
  @override
  Future<bool> checkConnection() async {
    try {
      final dioHelper = getIt<DioHelper>();

      final Response response = await dioHelper.dio.get(
        dotenv.get('google_url'),
      );
      if (response.statusCode == 200) {
        return Future(() => true);
      } else {
        return Future(() => false);
      }
    } catch (e) {
      return Future(() => false);
    }
  }
}
