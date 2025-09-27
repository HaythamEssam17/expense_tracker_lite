import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/Images/common_asset_svg_image_widget.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../../data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.item,
  });

  final Function() onTap;
  final bool isSelected;
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
              color: isSelected
                  ? context.appColors.primaryColor
                  : item.bgColor!.toColor(),
            ),
            child: CommonAssetSvgImageWidget(
              imageString: item.icon!,
              height: 20,
              width: 20,
              imageColor: isSelected
                  ? context.appColors.bgWhite
                  : item.iconColor?.toColor(),
            ),
          ),
          getSpaceHeight(4),
          CommonText(
            item.name!,
            fontSize: 11,
            color: isSelected
                ? context.appColors.primaryColor
                : context.textColors.main,
            fontFamily: isSelected ? Fonts.cairoBold : Fonts.cairoSemiBold,
          ),
        ],
      ),
    );
  }
}
