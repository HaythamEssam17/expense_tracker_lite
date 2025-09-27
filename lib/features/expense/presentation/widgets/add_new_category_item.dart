import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../../data/models/category_model.dart';

class AddNewCategoryItem extends StatelessWidget {
  const AddNewCategoryItem({
    super.key,
    required this.onTap,
    required this.item,
  });

  final Function() onTap;
  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: context.appColors.primaryColor),
            ),
            child: Icon(
              Icons.add,
              color: context.appColors.primaryColor,
              size: 20,
            ),
          ),
          getSpaceHeight(4),
          CommonText(
            item.name!,
            fontSize: 11,
            color: context.textColors.main,
            fontFamily: Fonts.cairoSemiBold,
          ),
        ],
      ),
    );
  }
}
