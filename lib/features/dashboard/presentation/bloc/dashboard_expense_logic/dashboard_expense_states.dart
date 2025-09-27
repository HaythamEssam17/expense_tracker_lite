part of 'dashboard_expense_cubit.dart';

@Injectable()
class DashboardExpenseStates {}

class DashboardExpenseInit extends DashboardExpenseStates {}

class DashboardExpenseLoading extends DashboardExpenseStates {}

class DashboardExpenseSuccess extends DashboardExpenseStates {}

class DashboardExpensesEmpty extends DashboardExpenseStates {}

class DashboardExpenseFailed extends DashboardExpenseStates {
  final String error;
  DashboardExpenseFailed(this.error);
}
