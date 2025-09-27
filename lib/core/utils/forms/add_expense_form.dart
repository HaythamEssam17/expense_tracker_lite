import 'package:flutter/material.dart';

class AddExpenseForm {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   TextEditingController categoryController = TextEditingController();
   TextEditingController amountController = TextEditingController();
   TextEditingController dateController = TextEditingController();
   TextEditingController receiptController = TextEditingController();

  void dispose() {
    categoryController.dispose();
    amountController.dispose();
    dateController.dispose();
    receiptController.dispose();
  }
}
