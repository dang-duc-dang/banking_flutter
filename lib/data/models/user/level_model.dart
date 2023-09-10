import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'commission_reserve_percent_stock.dart';
part 'level_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class LevelMember extends HiveObject {
  @HiveField(0, defaultValue: false)
  @JsonKey(defaultValue: false)
  bool isCommunityDevelopment;

  @JsonKey(defaultValue: '')
  @HiveField(1, defaultValue: '')
  String nameConst;

  @HiveField(2, defaultValue: [])
  @JsonKey(defaultValue: [])
  List<String> ownedBy;

  @HiveField(3, defaultValue: '')
  @JsonKey(defaultValue: '')
  String id;

  @HiveField(4, defaultValue: '')
  @JsonKey(defaultValue: '')
  String name;

  @HiveField(5, defaultValue: 0)
  @JsonKey(defaultValue: 0)
  int requiredStock;

  @HiveField(6, defaultValue: [])
  @JsonKey(defaultValue: [])
  List<dynamic> commissionCashPercentProduct;

  @HiveField(7, defaultValue: [])
  @JsonKey(defaultValue: [])
  List<dynamic> commissionReservePercentProduct;

  @HiveField(8, defaultValue: [])
  @JsonKey(defaultValue: [])
  List<dynamic> commissionCashPercentStock;

  // @HiveField(9, defaultValue: [])
  //   @JsonKey(defaultValue: '')
  // List<CommissionReservePercentStock>? commissionReservePercentStock;

  @HiveField(10, defaultValue: '')
  @JsonKey(defaultValue: '')
  String createdAt;

  @HiveField(11, defaultValue: '')
  @JsonKey(defaultValue: '')
  String updatedAt;

  @HiveField(12, defaultValue: 0)
  @JsonKey(defaultValue: 0)
  int level;

  LevelMember(
      {this.isCommunityDevelopment = false,
      this.nameConst = '',
      this.ownedBy = const [],
      this.id = '',
      this.name = '',
      this.requiredStock = 0,
      this.commissionCashPercentProduct = const [],
      this.commissionReservePercentProduct = const [],
      this.commissionCashPercentStock = const [],
      // this.commissionReservePercentStock=const [],
      this.createdAt = '',
      this.updatedAt = '',
      this.level = 0});

  factory LevelMember.fromJson(Map<String, dynamic> json) =>
      _$LevelMemberFromJson(json);

  Map<String, dynamic> toJson() => _$LevelMemberToJson(this);
}
