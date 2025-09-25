import 'package:expense_tracker_lite/core/constants/icon_paths.dart';
import 'package:expense_tracker_lite/core/utils/forms/utils_shared_forms.dart';
import 'package:expense_tracker_lite/features/expense/data/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/forms/add_expense_form.dart';

part 'category_states.dart';

@Injectable()
class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInit());

  @override
  Future<void> close() {
    addExpenseForm.dispose();
    return super.close();
  }

  AddExpenseForm addExpenseForm = Forms.addExpense;

  CategoryModel? selectedCategory;
  bool showCategories = false;
  int selectedIndex = 0;

  void selectCategory(CategoryModel category, int index) {
    selectedCategory = category;
    selectedIndex = index;
    addExpenseForm.categoryController.text = category.name!;

    emit(CategorySelected());
  }

  void showCategoriesList() {
    showCategories = !showCategories;
    emit(CategoryListShown());
  }

  final List<CategoryModel> categories = [
    CategoryModel(id: 1, icon: IconPath.cartIcon, name: 'Groceries'),
    CategoryModel(id: 2, icon: IconPath.celebrateIcon, name: 'Entertainment'),
    CategoryModel(id: 3, icon: IconPath.gasIcon, name: 'Gas'),
    CategoryModel(id: 4, icon: IconPath.shoppingIcon, name: 'Shopping'),
    CategoryModel(id: 5, icon: IconPath.newsIcon, name: 'News Paper'),
    CategoryModel(id: 6, icon: IconPath.cartIcon, name: 'Transport'),
    CategoryModel(id: 7, icon: IconPath.rentIcon, name: 'Rent'),
  ];
}
