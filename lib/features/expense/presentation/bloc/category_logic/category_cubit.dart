import 'package:expense_tracker_lite/core/constants/app_constants.dart';
import 'package:expense_tracker_lite/core/constants/icon_paths.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/color_extensions.dart';
import 'package:expense_tracker_lite/features/expense/data/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_states.dart';

@Injectable()
class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInit());

  @override
  Future<void> close() {
    // addExpenseForm.dispose();
    return super.close();
  }

  // AddExpenseForm addExpenseForm = Forms.addExpense;

  CategoryModel? selectedCategory;
  bool showCategories = false;
  int selectedIndex = -1;

  void selectCategory(CategoryModel category, int index) {
    selectedCategory = category;
    selectedIndex = index;

    emit(CategorySelected());
  }

  void showCategoriesList() {
    showCategories = !showCategories;
    emit(CategoryListShown());
  }

  List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      icon: IconPath.cartIcon,
      name: 'Groceries',
      bgColor: AppConstants.containerColor.toHex(),
      iconColor: AppConstants.iconColor.toHex(),
    ),
    CategoryModel(
      id: 2,
      icon: IconPath.celebrateIcon,
      name: 'Entertainment',
      bgColor: AppConstants.containerColor.toHex(),
      iconColor: AppConstants.iconColor.toHex(),
    ),
    CategoryModel(
      id: 3,
      icon: IconPath.gasIcon,
      name: 'Gas',
      bgColor: AppConstants.containerColor.toHex(),
      iconColor: AppConstants.iconColor.toHex(),
    ),
    CategoryModel(
      id: 4,
      icon: IconPath.shoppingIcon,
      name: 'Shopping',
      bgColor: AppConstants.containerColor.toHex(),
      iconColor: AppConstants.iconColor.toHex(),
    ),
    CategoryModel(
      id: 5,
      icon: IconPath.newsIcon,
      name: 'News Paper',
      bgColor: AppConstants.containerColor.toHex(),
      iconColor: AppConstants.iconColor.toHex(),
    ),
    CategoryModel(
      id: 6,
      icon: IconPath.cartIcon,
      name: 'Transport',
      bgColor: AppConstants.containerColor.toHex(),
      iconColor: AppConstants.iconColor.toHex(),
    ),
    CategoryModel(
      id: 7,
      icon: IconPath.rentIcon,
      name: 'Rent',
      bgColor: AppConstants.containerColor.toHex(),
      iconColor: AppConstants.iconColor.toHex(),
    ),
  ];

  List<CategoryModel> get categoriesWithAdd {
    return [
      ...categories,
      CategoryModel(id: -1, icon: IconPath.addIcon, name: 'Add Category'),
    ];
  }
}
