import 'package:flutter/material.dart';

import '../helpers/shared.dart';
import 'Images/common_asset_svg_image_widget.dart';
import 'common_global_button.dart';
import 'common_title_text.dart';

class CommonError extends StatelessWidget {
  final String? errorMassage;
  final bool? withButton;
  final Function()? onTap;

  const CommonError({
    super.key,
    this.errorMassage,
    this.withButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: CommonAssetSvgImageWidget(
            imageString: "error_icon.svg",
            height: 220,
            width: 280,
            fit: BoxFit.fill,
          ),
        ),
        getSpaceHeight(16),
        const CommonText(
          'Something error happened',
          textAlign: TextAlign.center,
        ),
        getSpaceHeight(8),
        Row(
          children: [
            Expanded(
              child: CommonText(
                errorMassage ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
        if (withButton!) ...[
          getSpaceHeight(16),
          CommonGlobalButton(
            onPressedFunction: onTap ?? () {},
            buttonText: 'Try again',
          ),
        ],
      ],
    );
  }
}
