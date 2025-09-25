// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:expense_tracker_lite/core/features/bottom_nav_feature/presentation/bloc/bottom_nav_cubit.dart'
    as _i969;
import 'package:expense_tracker_lite/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart'
    as _i543;
import 'package:expense_tracker_lite/di/network_module.dart' as _i903;
import 'package:expense_tracker_lite/features/expense/data/ds/api_expense_ds.dart'
    as _i13;
import 'package:expense_tracker_lite/features/expense/data/ds/mock_expense_ds.dart'
    as _i150;
import 'package:expense_tracker_lite/features/expense/data/repository_impl/expense_repository_impl.dart'
    as _i598;
import 'package:expense_tracker_lite/features/expense/domain/repository/expense_repository.dart'
    as _i522;
import 'package:expense_tracker_lite/features/expense/domain/usecases/expense_usecases.dart'
    as _i72;
import 'package:expense_tracker_lite/features/expense/presentation/bloc/category_logic/category_cubit.dart'
    as _i326;
import 'package:expense_tracker_lite/features/expense/presentation/bloc/expense_logic/expense_cubit.dart'
    as _i557;
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
    gh.factory<_i969.BottomNavCubit>(() => _i969.BottomNavCubit());
    gh.factory<_i326.CategoryCubit>(() => _i326.CategoryCubit());
    gh.factory<_i326.CategoryStates>(() => _i326.CategoryStates());
    gh.factory<_i557.ExpenseStates>(() => _i557.ExpenseStates());
    gh.lazySingleton<_i895.Connectivity>(() => networkModule.connectivity);
    gh.factory<_i13.ApiExpenseDataSource>(
      () => _i13.ApiExpenseDataSourceImpl(),
    );
    gh.factory<_i150.MockRemoteDataSource>(
      () => _i150.MockRemoteDataSourceImpl(),
    );
    gh.factory<_i522.IExpenseRepository>(
      () => _i598.ExpenseRepository(
        gh<_i150.MockRemoteDataSource>(),
        gh<_i13.ApiExpenseDataSource>(),
      ),
    );
    gh.factory<_i72.ExpenseUseCases>(
      () => _i72.ExpenseUseCases(gh<_i522.IExpenseRepository>()),
    );
    gh.factory<_i557.ExpenseCubit>(
      () => _i557.ExpenseCubit(gh<_i72.ExpenseUseCases>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i903.NetworkModule {}
