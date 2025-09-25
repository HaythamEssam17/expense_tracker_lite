import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? category;

  @HiveField(2)
  double? amount;

  @HiveField(3)
  String? currency;

  @HiveField(4)
  double? usdAmount;

  @HiveField(5)
  DateTime? date;

  @HiveField(6)
  String? receiptPath;

  ExpenseModel({
    this.id,
    this.category,
    this.amount,
    this.currency,
    this.usdAmount,
    this.date,
    this.receiptPath,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);
}
