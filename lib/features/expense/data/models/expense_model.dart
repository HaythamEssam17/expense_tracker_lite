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

  @HiveField(7)
  String? bgColor;

  @HiveField(8)
  String? iconColor;

  @HiveField(9)
  String? icon;

  ExpenseModel({
    this.id,
    this.category,
    this.amount,
    this.currency,
    this.usdAmount,
    this.date,
    this.receiptPath,
    this.bgColor,
    this.iconColor,
    this.icon,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);
}
