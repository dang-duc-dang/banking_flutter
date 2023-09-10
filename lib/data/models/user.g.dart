// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      point: json['point'] as int? ?? 0,
      enableFcm: json['enableFcm'] as bool? ?? false,
      country: json['country'] as String? ?? '',
      zipCode: json['zipCode'] as String? ?? '',
      role: json['role'] as String? ?? '',
      id: json['id'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      fullName: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      fcmTopic: json['fcmTopic'] as List<dynamic>? ?? [],
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'point': instance.point,
      'enableFcm': instance.enableFcm,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'role': instance.role,
      'id': instance.id,
      'verified': instance.verified,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'fcmTopic': instance.fcmTopic,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
