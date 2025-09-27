import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class BalanceModel extends HiveObject {
  @HiveField(0)
  double totalBalance;

  @HiveField(1)
  double incomeBalance;

  @HiveField(2)
  double expenseBalance;

  BalanceModel({
    this.totalBalance = 0,
    this.incomeBalance = 0,
    this.expenseBalance = 0,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceModelToJson(this);
}
