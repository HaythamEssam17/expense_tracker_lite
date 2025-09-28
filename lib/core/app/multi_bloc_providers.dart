import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../features/dashboard/presentation/bloc/dashboard_expense_logic/dashboard_expense_cubit.dart';
import '../../features/expense/presentation/bloc/add_expense_logic/add_expense_cubit.dart';
import '../../features/expense/presentation/bloc/category_logic/category_cubit.dart';
import '../../features/expense/presentation/bloc/expenses_logic/expenses_cubit.dart';
import '../features/bottom_nav_feature/presentation/bloc/bottom_nav_cubit.dart';
import '../features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart';
import '../features/export_files_feature/presentation/bloc/export_cubit.dart';
import '../features/upload_media_featue/presentation/bloc/upload_media_cubit.dart';

class MultiBlocProvidersPage extends StatefulWidget {
  final Widget body;

  const MultiBlocProvidersPage({super.key, required this.body});

  @override
  State<StatefulWidget> createState() => _MultiBlocProvidersPageState();
}

class _MultiBlocProvidersPageState extends State<MultiBlocProvidersPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>(
          create: (_) => getIt<ConnectivityCubit>(),
        ),
        BlocProvider<AddExpenseCubit>(create: (_) => getIt<AddExpenseCubit>()),
        BlocProvider<ExpensesCubit>(create: (_) => getIt<ExpensesCubit>()),
        BlocProvider<DashboardExpenseCubit>(
          create: (_) => getIt<DashboardExpenseCubit>(),
        ),
        BlocProvider<BottomNavCubit>(create: (_) => getIt<BottomNavCubit>()),
        BlocProvider<CategoryCubit>(create: (_) => getIt<CategoryCubit>()),
        BlocProvider<ExportCubit>(create: (_) => getIt<ExportCubit>()),
        BlocProvider<UploadMediaCubit>(
          create: (_) => getIt<UploadMediaCubit>(),
        ),
      ],
      child: widget.body,
    );
  }
}
