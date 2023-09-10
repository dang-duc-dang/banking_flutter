// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LevelMemberAdapter extends TypeAdapter<LevelMember> {
  @override
  final int typeId = 1;

  @override
  LevelMember read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LevelMember(
      isCommunityDevelopment: fields[0] == null ? false : fields[0] as bool,
      nameConst: fields[1] == null ? '' : fields[1] as String,
      ownedBy: fields[2] == null ? [] : (fields[2] as List).cast<String>(),
      id: fields[3] == null ? '' : fields[3] as String,
      name: fields[4] == null ? '' : fields[4] as String,
      requiredStock: fields[5] == null ? 0 : fields[5] as int,
      commissionCashPercentProduct:
          fields[6] == null ? [] : (fields[6] as List).cast<dynamic>(),
      commissionReservePercentProduct:
          fields[7] == null ? [] : (fields[7] as List).cast<dynamic>(),
      commissionCashPercentStock:
          fields[8] == null ? [] : (fields[8] as List).cast<dynamic>(),
      createdAt: fields[10] == null ? '' : fields[10] as String,
      updatedAt: fields[11] == null ? '' : fields[11] as String,
      level: fields[12] == null ? 0 : fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LevelMember obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.isCommunityDevelopment)
      ..writeByte(1)
      ..write(obj.nameConst)
      ..writeByte(2)
      ..write(obj.ownedBy)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.requiredStock)
      ..writeByte(6)
      ..write(obj.commissionCashPercentProduct)
      ..writeByte(7)
      ..write(obj.commissionReservePercentProduct)
      ..writeByte(8)
      ..write(obj.commissionCashPercentStock)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelMemberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelMember _$LevelMemberFromJson(Map<String, dynamic> json) => LevelMember(
      isCommunityDevelopment: json['isCommunityDevelopment'] as bool? ?? false,
      nameConst: json['nameConst'] as String? ?? '',
      ownedBy: (json['ownedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      requiredStock: json['requiredStock'] as int? ?? 0,
      commissionCashPercentProduct:
          json['commissionCashPercentProduct'] as List<dynamic>? ?? [],
      commissionReservePercentProduct:
          json['commissionReservePercentProduct'] as List<dynamic>? ?? [],
      commissionCashPercentStock:
          json['commissionCashPercentStock'] as List<dynamic>? ?? [],
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      level: json['level'] as int? ?? 0,
    );

Map<String, dynamic> _$LevelMemberToJson(LevelMember instance) =>
    <String, dynamic>{
      'isCommunityDevelopment': instance.isCommunityDevelopment,
      'nameConst': instance.nameConst,
      'ownedBy': instance.ownedBy,
      'id': instance.id,
      'name': instance.name,
      'requiredStock': instance.requiredStock,
      'commissionCashPercentProduct': instance.commissionCashPercentProduct,
      'commissionReservePercentProduct':
          instance.commissionReservePercentProduct,
      'commissionCashPercentStock': instance.commissionCashPercentStock,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'level': instance.level,
    };
