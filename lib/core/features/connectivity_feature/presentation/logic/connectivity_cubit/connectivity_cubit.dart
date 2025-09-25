import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../helpers/shared.dart';
import '../../../../../network/error_handling/custom_exception.dart';

part 'connectivity_states.dart';

@Injectable()
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();

  ConnectivityCubit() : super(InternetLoading()) {
    try {
      _connectivity.onConnectivityChanged.listen((
        List<ConnectivityResult> result,
      ) {
        if (result.isEmpty || result[0] == ConnectivityResult.none) {
          emit(InternetDisconnected());
        } else {
          emit(InternetConnected());
        }
      });
    } on CustomException catch (e) {
      devLog('Failed to check connection: $e');
      emit(InternetDisconnected());
    }
  }

  @override
  Future<void> close() {
    // _subscription.cancel();
    return super.close();
  }
}
