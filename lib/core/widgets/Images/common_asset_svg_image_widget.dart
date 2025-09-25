import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAssetSvgImageWidget extends StatelessWidget {
  final String imageString;
  final double? height;
  final double? width;
  final bool isCircular;
  final Color? imageColor;
  final double radius;
  final BoxFit fit;

  const CommonAssetSvgImageWidget({
    super.key,
    required this.imageString,
    this.height,
    this.width,
    this.isCircular = false,
    this.radius = 0.0,
    this.imageColor,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SvgPicture.asset(
        'assets/images/$imageString',
        fit: fit,
        colorFilter: imageColor == null
            ? null
            : ColorFilter.mode(imageColor!, BlendMode.srcIn),
        height: height == null ? null : (height!).sp,
        width: isCircular
            ? height == null
                  ? null
                  : (height!).sp
            : width == null
            ? null
            : (width!).sp,
      ),
    );
  }
}
