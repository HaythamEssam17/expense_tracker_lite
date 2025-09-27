// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BalanceModelAdapter extends TypeAdapter<BalanceModel> {
  @override
  final int typeId = 2;

  @override
  BalanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BalanceModel();
  }

  @override
  void write(BinaryWriter writer, BalanceModel obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BalanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) => BalanceModel(
  totalBalance: (json['totalBalance'] as num?)?.toDouble() ?? 0,
  incomeBalance: (json['incomeBalance'] as num?)?.toDouble() ?? 0,
  expenseBalance: (json['expenseBalance'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'totalBalance': instance.totalBalance,
      'incomeBalance': instance.incomeBalance,
      'expenseBalance': instance.expenseBalance,
    };
