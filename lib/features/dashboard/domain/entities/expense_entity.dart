class ExpenseEntity {
  final String category;
  final double amount;
  final String currency;
  final double usdAmount;
  final DateTime date;
  final String? receiptPath;

  ExpenseEntity({
    required this.category,
    required this.amount,
    required this.currency,
    required this.usdAmount,
    required this.date,
    this.receiptPath,
  });
}
