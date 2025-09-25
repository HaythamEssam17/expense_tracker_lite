import 'dart:io';

import 'package:flutter/material.dart';

class CommonFileImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;

  const CommonFileImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.radius = 0.0,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: Image.file(
        File(imagePath),
        fit: fit,
        // height: getWidgetHeight(height),
        // width: getWidgetHeight(height),
      ),
    );
  }
}
