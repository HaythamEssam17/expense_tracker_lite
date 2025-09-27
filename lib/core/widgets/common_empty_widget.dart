import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../helpers/shared.dart';
import 'Images/common_asset_svg_image_widget.dart';
import 'common_global_button.dart';
import 'common_title_text.dart';

class EmptyScreen extends StatelessWidget {
  final String imageString;
  final double imageHeight;
  final double imageWidth;
  final String titleKey;
  final String? description;
  final bool? withButton;
  final Function()? onTap;
  final String? buttonText;

  const EmptyScreen({
    super.key,
    required this.imageString,
    required this.titleKey,
    required this.imageHeight,
    required this.imageWidth,
    this.description,
    this.withButton = false,
    this.onTap,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getSpaceHeight(80),
        Center(
          child: CommonAssetSvgImageWidget(
            imageString: imageString,
            height: imageHeight,
            width: imageWidth,
            fit: BoxFit.fill,
          ),
        ),
        getSpaceHeight(24),
        Center(
          child: CommonText(titleKey, maxLines: 2, textAlign: TextAlign.center),
        ),
        if (description != null) ...[
          getSpaceHeight(8),
          Center(
            child: CommonText(
              description!,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
        if (withButton!) ...[
          getSpaceHeight(8),
          CommonGlobalButton(
            radius: 8,
            width: 140,
            height: 40,
            buttonBackgroundColor: context.textColors.error,
            onPressedFunction: onTap ?? () {},
            buttonText: buttonText ?? 'Retry',
            buttonTextFontWeight: FontWeight.w400,
            elevation: 0,
          ),
        ],
      ],
    );
  }
}
