import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../features/dashboard/presentation/bloc/expense_logic/expense_cubit.dart';
import '../features/connectivity_feature/presentation/logic/connectivity_cubit/connectivity_cubit.dart';

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
        BlocProvider<ExpenseCubit>(create: (_) => getIt<ExpenseCubit>()),
      ],
      child: widget.body,
    );
  }
}
