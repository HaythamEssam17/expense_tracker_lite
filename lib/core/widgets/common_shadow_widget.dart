import 'package:expense_tracker_lite/core/helpers/extensions/container_decorations.dart';
import 'package:flutter/material.dart';

class CommonShadowWidget extends StatelessWidget {
  const CommonShadowWidget({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration()
          .card(context)
          .copyWith(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: widget,
      ),
    );
  }
}
