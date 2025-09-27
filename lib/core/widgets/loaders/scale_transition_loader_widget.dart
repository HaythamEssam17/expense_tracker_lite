import 'package:expense_tracker_lite/core/constants/icon_paths.dart';
import 'package:flutter/material.dart';

import '../Images/common_asset_image_widget.dart';

class LoadingShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;

  const LoadingShimmer({
    super.key,
    this.radius = 8,
    this.height = 78,
    this.width = 237,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: CommonAssetImageWidget(
        imageString: IconPath.shimmerIcon,
        height: height!,
        width: width!,
        fit: BoxFit.fill,
      ),
    );
  }
}
