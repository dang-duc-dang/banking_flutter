import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'commission_reserve_percent_stock.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class CommissionReservePercentStock extends HiveObject {
  @HiveField(0, defaultValue: '')
  @JsonKey(defaultValue: '')
  String levelReferral;

  @JsonKey(defaultValue: 0)
  @HiveField(1, defaultValue: 0)
  int percent;

  CommissionReservePercentStock({this.levelReferral = '', this.percent = 0});
  factory CommissionReservePercentStock.fromJson(Map<String, dynamic> json) =>
      _$CommissionReservePercentStockFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionReservePercentStockToJson(this);
}
