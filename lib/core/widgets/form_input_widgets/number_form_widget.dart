import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common_text_form_field_widget.dart';

class NumberFormWidget extends StatelessWidget {
  final TextEditingController numberController;
  final String? Function(String?)? numberOnChanged;
  final String? hintKey;
  final Widget? suffixIcon;
  final int maxLines;
  final int minLines;
  final bool checkValidation;
  final List<TextInputFormatter>? inputFormatters;
  final bool withSuffixIconConstraints;

  const NumberFormWidget({
    super.key,
    required this.numberController,
    required this.numberOnChanged,
    this.hintKey,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.checkValidation = true,
    this.withSuffixIconConstraints = true,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      controller: numberController,
      hintKey: hintKey,
      keyboardType: TextInputType.text,
      suffixIcon: suffixIcon,
      minLines: minLines,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      withSuffixIconConstraints: withSuffixIconConstraints,
      validator: checkValidation
          ? (value) {
              if (value!.isEmpty) {
                return 'Empty field.';
              } else if (value.length < 2) {
                return 'Length must be more than 2 chars.';
              } else {
                return null;
              }
            }
          : null,
      onChanged: numberOnChanged,
    );
  }
}
