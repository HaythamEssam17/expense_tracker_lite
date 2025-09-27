part of 'add_expense_cubit.dart';

@Injectable()
class AddExpenseStates {}

class AddExpenseInit extends AddExpenseStates {}

class AddExpenseLoading extends AddExpenseStates {}

class AddExpenseAddedSuccess extends AddExpenseStates {}

class AddExpenseAddedFailed extends AddExpenseStates {
  final String errorMessage;
  AddExpenseAddedFailed(this.errorMessage);
}
