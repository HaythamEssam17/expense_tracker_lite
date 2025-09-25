import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/fonts.dart';
import 'package:expense_tracker_lite/core/widgets/Images/common_asset_svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../bloc/category_logic/category_cubit.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        final cubit = context.read<CategoryCubit>();

        return AnimatedCrossFade(
          firstChild: const SizedBox(),
          secondChild: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              // mainAxisExtent: 90,
            ),
            itemCount: cubit.categories.length,
            itemBuilder: (context, index) {
              final item = cubit.categories[index];
              final isSelected = cubit.selectedIndex == index;

              return GestureDetector(
                onTap: () => cubit.selectCategory(item, index),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? context.appColors.primaryColor
                            : Colors.blue.withOpacity(0.1),
                      ),
                      child: CommonAssetSvgImageWidget(
                        imageString: item.icon!,
                        height: 20,
                        width: 20,
                        imageColor: isSelected
                            ? context.appColors.bgWhite
                            : context.appColors.primaryColor,
                      ),
                    ),
                    getSpaceHeight(4),
                    CommonText(
                      item.name!,
                      fontSize: 11,
                      color: isSelected
                          ? context.appColors.primaryColor
                          : context.textColors.main,
                      fontFamily: isSelected
                          ? Fonts.cairoBold
                          : Fonts.cairoRegular,
                    ),
                  ],
                ),
              );
            },
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
