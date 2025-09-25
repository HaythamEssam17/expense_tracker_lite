import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat("#,##0.##", "en_US");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    final clean = newValue.text.replaceAll(",", "");

    final number = double.tryParse(clean);
    if (number == null) return oldValue;

    final newText = _formatter.format(number);

    int selectionIndex =
        newText.length - (clean.length - newValue.selection.end);

    if (selectionIndex < 0) selectionIndex = 0;
    if (selectionIndex > newText.length) selectionIndex = newText.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
