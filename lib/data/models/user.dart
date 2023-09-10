import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends HiveObject {
  @JsonKey(defaultValue: 0)
  int point;

  @JsonKey(defaultValue: false)
  bool enableFcm;

  @JsonKey(defaultValue: '')
  String country;

  @JsonKey(defaultValue: '')
  String zipCode;

  @HiveField(4, defaultValue: '')
  @JsonKey(defaultValue: '')
  String role;

  @JsonKey(defaultValue: '')
  String id;

  @JsonKey(defaultValue: false)
  bool verified;

  @JsonKey(defaultValue: '')
  String fullName;

  @JsonKey(defaultValue: '')
  String email;

  @HiveField(10, defaultValue: '')
  @JsonKey(defaultValue: '')
  String phone;

  @JsonKey(defaultValue: [])
  List<dynamic> fcmTopic;

  @JsonKey(defaultValue: '')
  String createdAt;

  @JsonKey(defaultValue: '')
  String updatedAt;

  User(
      {this.point = 0,
      this.enableFcm = false,
      this.country = '',
      this.zipCode = '',
      this.role = '',
      this.id = '',
      this.verified = false,
      this.fullName = '',
      this.email = '',
      this.phone = '',
      this.fcmTopic = const [],
      this.createdAt = '',
      this.updatedAt = '',});
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
