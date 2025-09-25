import 'package:flutter/material.dart';

import '../../helpers/shared.dart';

class CommonAssetImageWidget extends StatelessWidget {
  final String imageString;
  final double? height;
  final double? width;
  final Color? imageColor;
  final double? radius;

  final BoxFit? fit;

  final Function()? onTapImage;

  const CommonAssetImageWidget({
    super.key,
    required this.imageString,
    this.height,
    this.width,
    this.imageColor,
    this.radius = 0.0,
    this.fit = BoxFit.contain,
    this.onTapImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapImage,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: Image.asset(
          'assets/images/$imageString',
          fit: fit,
          color: imageColor,
          height: getWidgetHeight(height!),
          width: getWidgetWidth(width!),
        ),
      ),
    );
  }
}
