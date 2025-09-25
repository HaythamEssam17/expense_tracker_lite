import 'package:flutter/material.dart';

class AddExpenseForm {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController receiptController = TextEditingController();

  void dispose() {
    categoryController.dispose();
    amountController.dispose();
    dateController.dispose();
    receiptController.dispose();
  }
}
