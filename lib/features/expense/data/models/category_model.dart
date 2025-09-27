import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class CategoryModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? icon;

  @HiveField(3)
  String? bgColor;

  @HiveField(4)
  String? iconColor;

  CategoryModel({this.id, this.name, this.icon, this.bgColor, this.iconColor});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
