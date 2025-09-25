// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:expense_tracker_lite/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart'
    as _i543;
import 'package:expense_tracker_lite/di/network_module.dart' as _i903;
import 'package:expense_tracker_lite/features/dashboard/data/ds/api_expense_ds.dart'
    as _i395;
import 'package:expense_tracker_lite/features/dashboard/data/ds/mock_expense_ds.dart'
    as _i852;
import 'package:expense_tracker_lite/features/dashboard/data/repository_impl/expense_repository_impl.dart'
    as _i16;
import 'package:expense_tracker_lite/features/dashboard/domain/repository/expense_repository.dart'
    as _i716;
import 'package:expense_tracker_lite/features/dashboard/domain/usecases/expense_usecases.dart'
    as _i991;
import 'package:expense_tracker_lite/features/dashboard/presentation/bloc/expense_logic/expense_cubit.dart'
    as _i91;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i543.ConnectivityCubit>(() => _i543.ConnectivityCubit());
    gh.factory<_i91.ExpenseStates>(() => _i91.ExpenseStates());
    gh.lazySingleton<_i895.Connectivity>(() => networkModule.connectivity);
    gh.factory<_i395.ApiExpenseDataSource>(
      () => _i395.ApiExpenseDataSourceImpl(),
    );
    gh.factory<_i852.MockRemoteDataSource>(
      () => _i852.MockRemoteDataSourceImpl(),
    );
    gh.factory<_i716.IExpenseRepository>(
      () => _i16.ExpenseRepository(
        gh<_i852.MockRemoteDataSource>(),
        gh<_i395.ApiExpenseDataSource>(),
      ),
    );
    gh.factory<_i991.ExpenseUseCases>(
      () => _i991.ExpenseUseCases(gh<_i716.IExpenseRepository>()),
    );
    gh.factory<_i91.ExpenseCubit>(
      () => _i91.ExpenseCubit(gh<_i991.ExpenseUseCases>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i903.NetworkModule {}
