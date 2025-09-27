import 'package:expense_tracker_lite/core/widgets/loaders/scale_transition_loader_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/shared.dart';

class ListLoaderWidget extends StatelessWidget {
  final Axis? direction;
  final int? itemCount;
  final double itemHeight;
  final double itemWidth;
  final double itemRadius;
  final EdgeInsetsGeometry? padding;
  const ListLoaderWidget({
    super.key,
    this.direction = Axis.vertical,
    this.itemCount = 5,
    this.itemHeight = 40,
    this.itemWidth = 300,
    this.itemRadius = 8,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: padding,
      physics: const BouncingScrollPhysics(),
      scrollDirection: direction!,
      itemBuilder: (context, index) {
        return LoadingShimmer(
          height: itemHeight,
          width: itemWidth,
          radius: itemRadius,
        );
      },
      separatorBuilder: (context, index) {
        return direction == Axis.vertical
            ? getSpaceHeight(8)
            : getSpaceWidth(8);
      },
      itemCount: itemCount!,
    );
  }
}
