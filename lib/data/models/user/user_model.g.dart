// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      point: fields[0] == null ? 0 : fields[0] as int,
      enableFcm: fields[1] == null ? false : fields[1] as bool,
      country: fields[2] == null ? '' : fields[2] as String,
      zipCode: fields[3] == null ? '' : fields[3] as String,
      role: fields[4] == null ? '' : fields[4] as String,
      id: fields[5] == null ? '' : fields[5] as String,
      verified: fields[6] == null ? false : fields[6] as bool,
      fullName: fields[7] == null ? '' : fields[7] as String,
      avatar: fields[8] == null ? [] : (fields[8] as List).cast<ImageModel>(),
      email: fields[9] == null ? '' : fields[9] as String,
      phone: fields[10] == null ? '' : fields[10] as String,
      fcmTopic: fields[11] == null ? [] : (fields[11] as List).cast<dynamic>(),
      createdAt: fields[12] == null ? '' : fields[12] as String,
      updatedAt: fields[13] == null ? '' : fields[13] as String,
      levelMember: fields[14] as LevelMember?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.point)
      ..writeByte(1)
      ..write(obj.enableFcm)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.zipCode)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.verified)
      ..writeByte(7)
      ..write(obj.fullName)
      ..writeByte(8)
      ..write(obj.avatar)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.fcmTopic)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.levelMember);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      point: json['point'] as int? ?? 0,
      enableFcm: json['enableFcm'] as bool? ?? false,
      country: json['country'] as String? ?? '',
      zipCode: json['zipCode'] as String? ?? '',
      role: json['role'] as String? ?? '',
      id: json['id'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      fullName: json['fullName'] as String? ?? '',
      avatar: (json['avatar'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      fcmTopic: json['fcmTopic'] as List<dynamic>? ?? [],
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      levelMember: json['levelMember'] == null
          ? null
          : LevelMember.fromJson(json['levelMember'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'point': instance.point,
      'enableFcm': instance.enableFcm,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'role': instance.role,
      'id': instance.id,
      'verified': instance.verified,
      'fullName': instance.fullName,
      'avatar': instance.avatar.map((e) => e.toJson()).toList(),
      'email': instance.email,
      'phone': instance.phone,
      'fcmTopic': instance.fcmTopic,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'levelMember': instance.levelMember?.toJson(),
    };
