import 'package:food_flutter/data/models/image/image_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class UserModel extends HiveObject {
  @HiveField(0, defaultValue: '')
  @JsonKey(defaultValue: '')
  String id;

  @HiveField(1, defaultValue: "")
  @JsonKey(defaultValue: '')
  String role;

  @HiveField(2, defaultValue: '')
  @JsonKey(defaultValue: '')
  String phone;

  @HiveField(3, defaultValue: '')
  @JsonKey(defaultValue: '')
  String email;

  @HiveField(4, defaultValue: false)
  @JsonKey(defaultValue: false)
  bool isBlocked;

  @HiveField(5, defaultValue: '')
  @JsonKey(defaultValue: '')
  String createdAt;

  UserModel({
    this.role = '',
    this.id = '',
    this.email = '',
    this.phone = '',
    this.createdAt = '',
    this.isBlocked = false,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
