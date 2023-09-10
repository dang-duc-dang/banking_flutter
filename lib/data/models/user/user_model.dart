import 'package:food_flutter/data/models/image/image_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class UserModel extends HiveObject {
  @HiveField(0, defaultValue: 0)
  @JsonKey(defaultValue: 0)
  int point;

  @HiveField(1, defaultValue: false)
  @JsonKey(defaultValue: false)
  bool enableFcm;

  @HiveField(2, defaultValue: '')
  @JsonKey(defaultValue: '')
  String country;

  @HiveField(3, defaultValue: '')
  @JsonKey(defaultValue: '')
  String zipCode;

  @HiveField(4, defaultValue: '')
  @JsonKey(defaultValue: '')
  String role;

  @HiveField(5, defaultValue: '')
  @JsonKey(defaultValue: '')
  String id;

  @HiveField(6, defaultValue: false)
  @JsonKey(defaultValue: false)
  bool verified;

  @HiveField(7, defaultValue: '')
  @JsonKey(defaultValue: '')
  String fullName;

  @HiveField(8, defaultValue: [])
  @JsonKey(defaultValue: <ImageModel>[])
  List<ImageModel> avatar;

  @HiveField(9, defaultValue: '')
  @JsonKey(defaultValue: '')
  String email;

  @HiveField(10, defaultValue: '')
  @JsonKey(defaultValue: '')
  String phone;

  @HiveField(11, defaultValue: [])
  @JsonKey(defaultValue: [])
  List<dynamic> fcmTopic;

  @HiveField(12, defaultValue: '')
  @JsonKey(defaultValue: '')
  String createdAt;

  @HiveField(13, defaultValue: '')
  @JsonKey(defaultValue: '')
  String updatedAt;

  @HiveField(14, defaultValue: null)
  @JsonKey(defaultValue: null)
  LevelMember? levelMember;

  UserModel(
      {this.point = 0,
      this.enableFcm = false,
      this.country = '',
      this.zipCode = '',
      this.role = '',
      this.id = '',
      this.verified = false,
      this.fullName = '',
      this.avatar = const <ImageModel>[],
      this.email = '',
      this.phone = '',
      this.fcmTopic = const [],
      this.createdAt = '',
      this.updatedAt = '',
      this.levelMember});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
