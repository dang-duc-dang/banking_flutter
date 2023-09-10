// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_reserve_percent_stock.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommissionReservePercentStockAdapter
    extends TypeAdapter<CommissionReservePercentStock> {
  @override
  final int typeId = 2;

  @override
  CommissionReservePercentStock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommissionReservePercentStock(
      levelReferral: fields[0] == null ? '' : fields[0] as String,
      percent: fields[1] == null ? 0 : fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CommissionReservePercentStock obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.levelReferral)
      ..writeByte(1)
      ..write(obj.percent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommissionReservePercentStockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionReservePercentStock _$CommissionReservePercentStockFromJson(
        Map<String, dynamic> json) =>
    CommissionReservePercentStock(
      levelReferral: json['levelReferral'] as String? ?? '',
      percent: json['percent'] as int? ?? 0,
    );

Map<String, dynamic> _$CommissionReservePercentStockToJson(
        CommissionReservePercentStock instance) =>
    <String, dynamic>{
      'levelReferral': instance.levelReferral,
      'percent': instance.percent,
    };
