import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../../../../core/widgets/form_input_widgets/name_form_widget.dart';
import '../bloc/category_logic/category_cubit.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        final cubit = context.read<CategoryCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              'Categories',
              fontSize: 18,
              fontFamily: Fonts.cairoSemiBold,
            ),
            getSpaceHeight(8),
            InkWell(
              onTap: () {
                cubit.showCategoriesList();
              },
              child: AbsorbPointer(
                child: NameFormWidget(
                  nameController: cubit.addExpenseForm.categoryController,
                  hintKey: 'Category',
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 24,
                  ),
                  nameOnChanged: (value) => value,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
