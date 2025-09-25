import 'package:expense_tracker_lite/core/routers/route_names.dart';
import 'package:go_router/go_router.dart';

import '../../features/add_expense/presentation/pages/add_expense_home_page.dart';
import '../../features/auth/presentation/pages/splash_home_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_home_page.dart';

final router = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.splash,
      builder: (context, state) => const SplashHomePage(),
    ),
    GoRoute(
      path: '/${RouteNames.dashboardHomePage}',
      name: RouteNames.dashboardHomePage,
      builder: (context, state) => const DashboardHomePage(),
    ),
    GoRoute(
      path: '/${RouteNames.addExpenseHomePage}',
      name: RouteNames.addExpenseHomePage,
      builder: (context, state) => const AddExpenseHomePage(),
    ),
  ],
);
