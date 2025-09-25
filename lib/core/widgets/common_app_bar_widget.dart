import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../helpers/fonts.dart';
import '../routers/app_route.dart';
import 'common_title_text.dart';

class AppBarWithBottomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isBackArrow;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final Widget? customBottom;
  final double? bottomHeight;
  final double height;
  final bool safeAreaTop;

  const AppBarWithBottomWidget({
    Key? key,
    this.isBackArrow = true,
    this.title,
    this.centerTitle = false,
    this.actions,
    this.backgroundColor,
    this.titleColor,
    this.elevation = 0,
    this.bottom,
    this.customBottom,
    this.bottomHeight,
    this.height = (kToolbarHeight + 16),
    this.safeAreaTop = true,
  }) : assert(
         bottom == null || customBottom == null,
         'Provide either bottom (PreferredSizeWidget) or customBottom, not both.',
       ),
       super(key: key);

  @override
  Size get preferredSize {
    final double bHeight;
    if (bottom != null) {
      bHeight = bottom!.preferredSize.height;
    } else if (customBottom != null) {
      bHeight = bottomHeight ?? (height);
    } else {
      bHeight = 0;
    }

    return Size.fromHeight(height + bHeight);
  }

  @override
  Widget build(BuildContext context) {
    final Color bg = backgroundColor ?? context.appColors.primaryColor;

    final Widget bar = Material(
      color: bg,
      elevation: elevation,
      child: SafeArea(
        top: safeAreaTop,
        bottom: bottom != null,
        child: Row(
          children: [
            if (isBackArrow)
              InkWell(
                onTap: () => router.pop(),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: context.appColors.surfacesGray,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 16,
                    color: context.textColors.light,
                  ),
                ),
              )
            else
              const SizedBox(width: 12),
            Expanded(
              child: DefaultTextStyle(
                style:
                    Theme.of(context).appBarTheme.titleTextStyle ??
                    Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(color: Colors.white),
                child: title != null
                    ? CommonText(
                        title!,
                        fontSize: 16,
                        color: titleColor,
                        fontFamily: Fonts.elMessiriSemiBold,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            if (actions != null && actions!.isNotEmpty)
              Row(mainAxisSize: MainAxisSize.min, children: actions!)
            else if (isBackArrow)
              InkWell(
                onTap: () => router.canPop(),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 16,
                    color: Colors.transparent,
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    // bottom widget
    Widget? bottomWidget;
    if (bottom != null) {
      bottomWidget = bottom;
    } else if (customBottom != null) {
      bottomWidget = SizedBox(
        height: bottomHeight ?? (height),
        child: customBottom,
      );
    }

    if (bottomWidget != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // The tool bar (we already added SafeArea inside bar)
          bar,
          // bottom
          Material(
            elevation: elevation > 0 ? 0 : 0,
            color: bg,
            child: bottomWidget,
          ),
        ],
      );
    }

    return bar;
  }
}
