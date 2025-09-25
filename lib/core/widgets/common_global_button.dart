import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helpers/shared.dart';
import '../helpers/shared_texts.dart';
import 'common_title_text.dart';

class CommonGlobalButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressedFunction;
  final Color? buttonBackgroundColor;
  final Color? onPressedColor;
  final Color? shadowBackgroundColor;
  final double? elevation;
  final double? width;
  final double? height;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final FontWeight? buttonTextFontWeight;
  final Color? iconColor;
  final double? radius;
  final Widget? icon;
  final double? spaceSize;
  final bool isLoading;
  final bool isEnable;
  final bool showBorder;
  final Color? borderColor;

  const CommonGlobalButton({
    super.key,
    required this.buttonText,
    required this.onPressedFunction,
    this.buttonBackgroundColor,
    this.onPressedColor,
    this.shadowBackgroundColor,
    this.elevation = 0.0,
    this.width,
    this.height = 48,
    this.iconColor,
    this.buttonTextColor,
    this.buttonTextFontWeight = FontWeight.w400,
    this.buttonTextSize = 14,
    this.icon,
    this.radius = AppConstants.radius14,
    this.spaceSize = 8.0,
    this.isLoading = false,
    this.isEnable = true,
    this.showBorder = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = (width ?? SharedText.screenWidth).sp;
    final double buttonHeight = (height!).sp;

    return ElevatedButton(
      onPressed: isLoading || !isEnable ? null : onPressedFunction,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(elevation!),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(
            width: 1,
            color: showBorder
                ? isLoading || !isEnable
                      ? context.appColors.grey22
                      : borderColor!
                : Colors.transparent,
          ),
        ),
        shadowColor: WidgetStateProperty.all(
          shadowBackgroundColor ?? context.appColors.grey22.withAlpha(30),
        ),
        overlayColor: WidgetStateProperty.all(
          onPressedColor ?? context.appColors.grey22.withAlpha(25),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          Size(buttonWidth, buttonHeight),
        ),
        backgroundColor: isLoading || !isEnable
            ? WidgetStateProperty.all(context.appColors.greyF5)
            : WidgetStateProperty.all(
                buttonBackgroundColor ?? context.appColors.primaryColor,
              ),
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLoading) icon!,
                getSpaceWidth(spaceSize!),
                CommonText(
                  isLoading ? 'Loading...' : buttonText,
                  fontSize: buttonTextSize!,
                  fontWeight: buttonTextFontWeight!,
                  color: isEnable
                      ? isLoading
                            ? context.appColors.grey22
                            : buttonTextColor!
                      : context.appColors.grey22,
                ),
              ],
            )
          : CommonText(
              isLoading ? 'Loading...' : buttonText,
              fontSize: buttonTextSize!,
              fontWeight: buttonTextFontWeight!,
              color: isEnable
                  ? isLoading
                        ? context.appColors.grey22
                        : buttonTextColor ?? context.textColors.white
                  : context.appColors.grey22,
            ),
    );
  }
}
