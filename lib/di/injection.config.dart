// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:expense_tracker_lite/core/features/bottom_nav_feature/presentation/bloc/bottom_nav_cubit.dart'
    as _i969;
import 'package:expense_tracker_lite/core/features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart'
    as _i543;
import 'package:expense_tracker_lite/core/features/export_files_feature/data/ds/export_ds.dart'
    as _i368;
import 'package:expense_tracker_lite/core/features/export_files_feature/data/export_repository/export_repository_impl.dart'
    as _i709;
import 'package:expense_tracker_lite/core/features/export_files_feature/domain/repository/export_repository.dart'
    as _i402;
import 'package:expense_tracker_lite/core/features/export_files_feature/domain/usecase/export_usecase.dart'
    as _i167;
import 'package:expense_tracker_lite/core/features/export_files_feature/presentation/bloc/export_cubit.dart'
    as _i913;
import 'package:expense_tracker_lite/core/features/upload_media_featue/data/datasource/upload_file_data_source.dart'
    as _i401;
import 'package:expense_tracker_lite/core/features/upload_media_featue/data/repository/upload_media_repository_impl.dart'
    as _i899;
import 'package:expense_tracker_lite/core/features/upload_media_featue/domain/repository/upload_media_repository.dart'
    as _i493;
import 'package:expense_tracker_lite/core/features/upload_media_featue/domain/usecase/upload_media_usecase.dart'
    as _i1028;
import 'package:expense_tracker_lite/core/features/upload_media_featue/presentation/bloc/upload_media_cubit.dart'
    as _i1062;
import 'package:expense_tracker_lite/core/network/dio_client.dart' as _i230;
import 'package:expense_tracker_lite/di/network_module.dart' as _i903;
import 'package:expense_tracker_lite/di/register_module.dart' as _i180;
import 'package:expense_tracker_lite/features/dashboard/data/ds/mock_dashboard_expense_ds.dart'
    as _i783;
import 'package:expense_tracker_lite/features/dashboard/data/repository_impl/dashboard_expense_repository_impl.dart'
    as _i330;
import 'package:expense_tracker_lite/features/dashboard/domain/repository/dashboard_expense_repository.dart'
    as _i851;
import 'package:expense_tracker_lite/features/dashboard/domain/usecases/dashboard_expense_usecase.dart'
    as _i964;
import 'package:expense_tracker_lite/features/dashboard/presentation/bloc/dashboard_expense_logic/dashboard_expense_cubit.dart'
    as _i489;
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
import 'package:expense_tracker_lite/features/expense/presentation/bloc/add_expense_logic/add_expense_cubit.dart'
    as _i882;
import 'package:expense_tracker_lite/features/expense/presentation/bloc/category_logic/category_cubit.dart'
    as _i326;
import 'package:expense_tracker_lite/features/expense/presentation/bloc/expenses_logic/expenses_cubit.dart'
    as _i618;
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
    final registerModule = _$RegisterModule();
    gh.factory<_i969.BottomNavCubit>(() => _i969.BottomNavCubit());
    gh.factory<_i543.ConnectivityCubit>(() => _i543.ConnectivityCubit());
    gh.factory<_i1062.UploadMediaStates>(() => _i1062.UploadMediaStates());
    gh.factory<_i882.AddExpenseStates>(() => _i882.AddExpenseStates());
    gh.factory<_i326.CategoryCubit>(() => _i326.CategoryCubit());
    gh.factory<_i326.CategoryStates>(() => _i326.CategoryStates());
    gh.factory<_i618.ExpensesStates>(() => _i618.ExpensesStates());
    gh.factory<_i489.DashboardExpenseStates>(
      () => _i489.DashboardExpenseStates(),
    );
    gh.lazySingleton<_i895.Connectivity>(() => networkModule.connectivity);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.factory<_i913.ExportState>(
      () => _i913.ExportState(
        isLoading: gh<bool>(),
        filePath: gh<String>(),
        error: gh<String>(),
      ),
    );
    gh.factory<_i13.ApiExpenseDataSource>(
      () => _i13.ApiExpenseDataSourceImpl(),
    );
    gh.factory<_i150.MockRemoteDataSource>(
      () => _i150.MockRemoteDataSourceImpl(),
    );
    gh.factory<_i783.MockDashboardExpenseDatsSource>(
      () => _i783.MockDashboardExpenseDatsSourceImpl(),
    );
    gh.lazySingleton<_i230.DioHelper>(
      () => registerModule.dioHelper(gh<_i361.Dio>()),
    );
    gh.factory<_i401.UploadMediaDataSource>(
      () => _i401.UploadMediaDataSourceImpl(),
    );
    gh.factory<_i368.ExpenseExportDataSource>(
      () => _i368.ExpenseExportDataSourceImpl(),
    );
    gh.factory<_i522.IExpenseRepository>(
      () => _i598.ExpenseRepositoryImpl(
        gh<_i150.MockRemoteDataSource>(),
        gh<_i13.ApiExpenseDataSource>(),
      ),
    );
    gh.factory<_i402.IExpenseExportRepository>(
      () => _i709.ExpenseExportRepositoryImpl(
        gh<_i368.ExpenseExportDataSource>(),
      ),
    );
    gh.factory<_i493.IUploadMediaRepository>(
      () => _i899.UploadMediaRepositoryImpl(gh<_i401.UploadMediaDataSource>()),
    );
    gh.factory<_i851.IDashboardExpenseRepository>(
      () => _i330.DashboardExpenseRepositoryImpl(
        gh<_i783.MockDashboardExpenseDatsSource>(),
      ),
    );
    gh.factory<_i964.DashboardExpenseUseCase>(
      () => _i964.DashboardExpenseUseCase(
        gh<_i851.IDashboardExpenseRepository>(),
      ),
    );
    gh.factory<_i489.DashboardExpenseCubit>(
      () => _i489.DashboardExpenseCubit(gh<_i964.DashboardExpenseUseCase>()),
    );
    gh.factory<_i1028.UploadMediaUseCase>(
      () => _i1028.UploadMediaUseCase(gh<_i493.IUploadMediaRepository>()),
    );
    gh.factory<_i1062.UploadMediaCubit>(
      () => _i1062.UploadMediaCubit(gh<_i1028.UploadMediaUseCase>()),
    );
    gh.factory<_i167.ExportExpensesUseCases>(
      () => _i167.ExportExpensesUseCases(gh<_i402.IExpenseExportRepository>()),
    );
    gh.factory<_i72.ExpenseUseCases>(
      () => _i72.ExpenseUseCases(gh<_i522.IExpenseRepository>()),
    );
    gh.factory<_i913.ExportCubit>(
      () =>
          _i913.ExportCubit(exportUseCase: gh<_i167.ExportExpensesUseCases>()),
    );
    gh.factory<_i882.AddExpenseCubit>(
      () => _i882.AddExpenseCubit(gh<_i72.ExpenseUseCases>()),
    );
    gh.factory<_i618.ExpensesCubit>(
      () => _i618.ExpensesCubit(gh<_i72.ExpenseUseCases>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i903.NetworkModule {}

class _$RegisterModule extends _i180.RegisterModule {}
