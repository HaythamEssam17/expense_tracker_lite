part of 'expenses_cubit.dart';

@Injectable()
class ExpensesStates {}

class ExpensesStateInit extends ExpensesStates {}

class ExpensesLoadingState extends ExpensesStates {}

class ExpensesLoadingMoreDateState extends ExpensesStates {}

class ExpensesEmptyState extends ExpensesStates {}

class ExpensesSuccessState extends ExpensesStates {}

class ExpensesSuccessMoreDateState extends ExpensesStates {}

class ExpensesErrorMoreDateState extends ExpensesStates {
  final String error;

  ExpensesErrorMoreDateState(this.error);
}

class ExpensesErrorState extends ExpensesStates {
  final String error;

  ExpensesErrorState(this.error);
}
