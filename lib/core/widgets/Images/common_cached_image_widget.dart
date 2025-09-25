import 'package:cached_network_image/cached_network_image.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../helpers/shared.dart';

class CommonCachedImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String? imagePlaceHolder;
  final double width;
  final double height;
  final double? radius;
  final BoxFit? fit;
  final bool? isCircular;
  final bool? isProfile;
  final Color? errorImageColor;
  const CommonCachedImageWidget({
    super.key,
    this.imageUrl,
    required this.width,
    required this.height,
    this.isCircular = false,
    this.isProfile = false,
    this.radius = 0.0,
    this.fit = BoxFit.fill,
    this.imagePlaceHolder,
    this.errorImageColor,
  });

  @override
  Widget build(BuildContext context) {
    final double imageHeight = getWidgetHeight(height);
    final double imageWidth = isCircular!
        ? getWidgetHeight(height)
        : getWidgetWidth(width);

    return CachedNetworkImage(
      imageUrl: (imageUrl?.isNotEmpty ?? false)
          ? imageUrl!
          : 'https://via.placeholder.com/600x400',
      memCacheWidth: 600,
      memCacheHeight: 400,
      imageBuilder: (context, imageProvider) => Container(
        height: imageHeight,
        width: imageWidth,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius!),
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      placeholder: (context, img) => Container(
        height: imageHeight,
        width: imageWidth,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius!)),
        child: Center(
          child: CircularProgressIndicator(
            color: context.appColors.primaryColor,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.info),
    );
  }
}
