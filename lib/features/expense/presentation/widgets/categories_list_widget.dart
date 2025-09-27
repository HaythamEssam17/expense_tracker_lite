import 'package:expense_tracker_lite/core/helpers/fonts.dart';
import 'package:expense_tracker_lite/features/expense/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../bloc/add_expense_logic/add_expense_cubit.dart';
import '../bloc/category_logic/category_cubit.dart';
import 'add_new_category_item.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        final cubit = context.read<CategoryCubit>();

        return AnimatedCrossFade(
          firstChild: const SizedBox(),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                'Categories',
                fontSize: 22,
                fontFamily: Fonts.cairoSemiBold,
              ),
              getSpaceHeight(16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 90,
                ),
                itemCount: cubit.categoriesWithAdd.length,
                itemBuilder: (context, index) {
                  final item = cubit.categoriesWithAdd[index];
                  final isSelected = cubit.selectedIndex == index;
                  if (item.id == -1) {
                    return AddNewCategoryItem(
                      onTap: () {},
                      item: cubit.categoriesWithAdd.last,
                    );
                  } else {
                    return CategoryItem(
                      onTap: () {
                        cubit.selectCategory(item, index);

                        context.read<AddExpenseCubit>().setCategory(item);
                      },
                      isSelected: isSelected,
                      item: item,
                    );
                  }
                },
              ),
            ],
          ),
          crossFadeState: cubit.showCategories
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500),
        );
      },
    );
  }
}
