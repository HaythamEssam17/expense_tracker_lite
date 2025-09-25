import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/fonts.dart';
import '../helpers/shared.dart';
import 'common_title_text.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintKey;
  final String? initialValue;
  final bool isPassword;
  final bool enabled;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool withSuffixIconConstraints;
  final int maxLines;
  final int minLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;

  const CommonTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hintKey,
    this.initialValue,
    this.isPassword = false,
    this.enabled = true,
    this.withSuffixIconConstraints = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.textStyle,
    this.hintStyle,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[CommonText(label!), getSpaceHeight(6.sp)],
        Container(
          constraints: const BoxConstraints(
            minHeight: 40,
            // maxHeight: maxLines == 1 ? 40 : double.infinity,
          ),
          child: TextFormField(
            controller: controller,
            initialValue: controller == null ? initialValue : null,
            obscureText: isPassword,
            enabled: enabled,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            onChanged: onChanged,
            maxLines: maxLines,
            minLines: minLines,
            style:
                textStyle ??
                context.textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: context.textColors.main,
                  fontFamily: Fonts.elMessiriRegular,
                ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              hintText: hintKey,
              hintStyle:
                  hintStyle ??
                  context.textTheme.titleMedium!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: context.appColors.surfacesGray6,
                    fontFamily: Fonts.elMessiriRegular,
                  ),
              filled: true,
              fillColor: enabled
                  ? context.appColors.surfacesGray5
                  : context.appColors.surfacesDark,
              prefixIcon: prefixIcon,
              prefixIconColor: Colors.red,
              prefixIconConstraints: BoxConstraints(
                maxHeight: 24.sp,
                maxWidth: 24.sp,
              ),
              suffixIcon: suffixIcon,
              suffixIconConstraints: withSuffixIconConstraints
                  ? BoxConstraints(maxHeight: 20.sp, maxWidth: 48.sp)
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.appColors.surfacesGray5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.appColors.primaryColor,
                  width: 1.8,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.textColors.error,
                  width: 0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.appColors.surfacesGray5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
